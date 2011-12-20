Feature: User create profile
  In order to publish my profile online
  As a user
  I want fill my profile basic info

Scenario Outline: fill in minimal required info successfully
  Given context
  When event
  Then outcome

Scenario Outline: required fields are missing
  Given context
  When event
  Then outcome




  
