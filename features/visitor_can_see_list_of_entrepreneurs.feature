Feature: Visitor can see list of entrepreneurs
  In order to to find a possible a coworker
  As a visitor
  I want browse among the list of entrepreneurs

Scenario: no entrepreneurs found
  Given there are no published profiles
  When I go to home
  Then I should see "Se el primero de muchos y regístrate ya!"

Scenario Outline: only one page of entrepreneurs found
  Given there are <number> published profiles
	When I go to home
  And I should see a list of <number> <object>
  Then I should not see "Muestrame más emprendedores"

Scenarios: published profiles less or equal to 14
 | number | object |
 | 2      | users  |
 | 4      | users  |
 | 5      | users  |
 | 9      | users  |


Scenario Outline: more than one page of entrepreneurs found
  Given there are <number> published profiles
  When I go to home
	And I click "Muestrame más emprendedores" <number_of_times> times
	Then I should not see "Muestrame más emprendedores"

Scenarios: published profiles more than 14
 | number | number_of_times |
 | 28     | 1               |
 | 84     | 5               |
 | 48     | 4               |

Scenario: displaying all the basic info in each entrepreneurs card
  Given there are 13 published profiles
  When I go to home
  Then I should see complete details for each card

Scenario: default list of entrepreneurs ordered by newcomers first
  Given there are 14 published profiles
  When I go to home
  Then I should see a list of entrepreneurs ordered by newcomers first
