Feature: Test the rpcutil agent

    Background:
        Given I want to use the config file support/client.cfg
        And I want to test the rpcutil agent

    Scenario: Test the get_fact action of the rpcutil agent
	Given the following request parameters:
	    | fact | mcollective |

        When I invoke the get_fact action
        Then the result should not be an error
        And the following parameters should be received as a result:
            | fact  | mcollective |
            | value | 1 |

