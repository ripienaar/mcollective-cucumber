require 'mcollective'

World(MCollective::RPC)

Before do
    @options = rpcoptions do |parser, options|
    end

    @request = {:options => @options}
end

