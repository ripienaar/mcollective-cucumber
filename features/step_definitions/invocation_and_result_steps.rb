Given /the following request parameters:/ do |table|
    @request = {}
    table.raw.each do |row|
        key = row[0].to_sym
        val = row[1]

        @request[key] = val
    end
end

When /I invoke the (.+) action/ do |action|
    @request[:options] = @options

    @reply = @agent.send(action, @request)[0]
end

Then /^the following parameters should be received as a result:$/ do |table|
    data = @reply[:data]

    table.raw.each do |row|
        key = row[0].to_sym
        val = row[1]

        raise "Reply does not have #{key}" unless data.keys.include?(key)

        if val == "should be present"
            raise "Received data does not include #{key}" unless data.include?(key)
        else
            if data[key].is_a?(String)
                if val =~ /^\/(.+)\/$/
                    regex = Regexp.new($1)
                else
                    regex = Regexp.new("^#{val}$")
                end

                raise "#{data[key]} does not match regex #{regex}" unless data[key].match(regex)

            elsif data[key].is_a?(Fixnum)
                raise "#{data[key]} does not match Fixnum #{val.to_i}" unless val.to_i == data[key]
            end
        end
    end
end
