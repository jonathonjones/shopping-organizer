Feature: Shopping Lists
  In order to shop easier
  A user
  Should be able to create and organize a shopping list

    Background:
      Given a user exists with a name of "Jonathon Jones"
        And I am signed in as "Jonathon Jones"

    Scenario: Seeing a list of shopping lists
      Given I have created a shopping list with a name of "May 10 List"
      When I go to the shopping lists page
      Then I should see "Shopping Lists"
        And I should see "May 10 List"

      When I follow "May 10 List"
        Then I should see "May 10 List"

    Scenario: Creating a shopping list
      When I go to the shopping lists page
        And I follow "Create a new shopping list"
      Then I should see "New Shopping List"

      When I fill in "Name" with "Cool List"
        And I press "Create"
      Then I should see "Cool List"
