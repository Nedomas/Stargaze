Feature: Clean start
  As an iOS developer
  I want my app to start properly

Scenario: 
  App should start

Given I launch the app
When I touch "Just click me!"
Then I should see "Hello mister"