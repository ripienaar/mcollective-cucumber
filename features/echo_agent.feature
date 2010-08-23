Feature: Test the echo agent

    Background:
	Given I want to use the config file /home/rip/.mcollective
	And I want to test the echo agent
	And I want to test hosts with class /neph/
	And I want to test hosts with fact country=de
       
    Scenario: Test the echo action
	Given the following request parameters:
	  | msg | hello world |

	When I invoke the echo action
	Then the result should not be an error
	And the following parameters should be received as a result:
	  | msg  | hello world |
	  | time | /.+/        |




