Given /I want to use the config file (.+)/ do |config|
    @options[:config] = config
end

Given /I want to test the (.+) agent/ do |agent|
    @agent = rpcclient(agent, :options => @options)
    @agent.progress = false
end

Given /I want to test hosts with class (.+)/ do |klass|
    @agent.class_filter klass
end

Given /I want to test hosts with fact (.+)=(.+)/ do |k, v|
    @agent.fact_filter k, v
end

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

Then /the result should not be an error/ do
    raise "Reply statuscode == #{@reply[:statuscode]}" unless @reply[:statuscode] == 0
end

Then /^the following parameters should be received as a result:$/ do |table|
    data = @reply[:data]

    table.raw.each do |row|
        key = row[0].to_sym
        val = row[1]

        raise "Reply does not have #{key}" unless data.keys.include?(key)

        if val =~ /^\/(.+)\/$/
            regex = Regexp.new($1)
        else
            regex = Regexp.new("^#{val}$")
        end

        raise "#{data[key]} does not match regex #{regex}" unless data[key].match(regex)
    end
end
