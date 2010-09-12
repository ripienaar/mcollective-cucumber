Feature: Test the rpcutil agent

    Background:
        Given I want to use the config file support/client.cfg
        And I want to test the rpcutil agent

    Scenario: Test the inventory action of the rpcutil agent
        When I invoke the inventory action
        Then the result should not be an error
        And the following parameters should be received as a result:
            | agents  | should be present |
            | facts   | should be present |
            | classes | should be present |
