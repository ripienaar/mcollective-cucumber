Feature: Test the rpcutil agent

    Background:
        Given I want to use the config file support/client.cfg
        And I want to test the rpcutil agent

    Scenario: Test the agent_inventory action of the rpcutil agent
        When I invoke the agent_inventory action
        Then the result should not be an error
        And the following parameters should be received as a result:
            | agents | should be present |
