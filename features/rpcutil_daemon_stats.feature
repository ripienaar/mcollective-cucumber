Feature: Test the rpcutil agent

    Background:
        Given I want to use the config file support/client.cfg
        And I want to test the rpcutil agent

    Scenario: Test the daemon_stats action of the rpcutil agent
        When I invoke the daemon_stats action
        Then the result should not be an error
        And the following parameters should be received as a result:
            | threads     | should be present |
            | agents      | should be present |
            | pid         | should be present |
            | times       | should be present |
            | validated   | should be present |
            | unvalidated | should be present |
            | passed      | should be present |
            | filtered    | should be present |
            | starttime   | should be present |
            | total       | should be present |
            | replies     | should be present |
