# Steps that pick the agent to test and apply filters as per
#
# http://marionette-collective.org/simplerpc/clients.html#applying_filters_programatically

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
