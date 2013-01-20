Feature: User creates profile

  As a user
  I want fill my profile basic info
  So that I can log-in the site 

Scenario: signup
  Given  I am on signup
  Then I should see "Sign up"
  
Scenario: signup
  When I go to new user registration
  Then I should see "Sign in"

