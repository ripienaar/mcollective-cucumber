# Tests for the various result statusses as per
#
# http://marionette-collective.org/simplerpc/clients.html#results_and_exceptions

Then /the result should not be an error/ do
    raise "Reply statuscode == #{@reply[:statuscode]}" unless @reply[:statuscode] == 0
end

Then /the request should have been aborted/ do
    raise "Reply statuscode == #{@reply[:statuscode]}" unless @reply[:statuscode] == 1
end

Then /the request should fail due to unknown action/ do
    raise "Reply statuscode == #{@reply[:statuscode]}" unless @reply[:statuscode] == 2
end

Then /the request should fail due to missing data/ do
    raise "Reply statuscode == #{@reply[:statuscode]}" unless @reply[:statuscode] == 3
end

Then /the request should fail due to invalid data/ do
    raise "Reply statuscode == #{@reply[:statuscode]}" unless @reply[:statuscode] == 4
end

Then /the request should fail due to an unknown error/ do
    raise "Reply statuscode == #{@reply[:statuscode]}" unless @reply[:statuscode] == 5
end
