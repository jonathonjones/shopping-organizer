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

    Scenario: Adding an item to a shopping list
      Given I have created a shopping list with a name of "June 2 List"
      When I go to the shopping lists page
        And I follow "June 2 List"
        And I follow "Add an item to the list"
        And I fill in "Amount" with "2"
        And I fill in "Name of Item" with "Apples"
        And I press "Create"
      Then I should see "June 2 List"
        And I should see "2 Apples"

    Scenario: Consolidating items
      Given I have created a shopping list with a name of "Hurley's List"
      When I go to the shopping lists page
        And I follow "Hurley's List"
        And I follow "Add an item to the list"
        And I fill in "Amount" with "4"
        And I select "cup" from "Unit"
        And I fill in "Name of Item" with "dry cat food"
        And I press "Create"
        And I follow "Add an item to the list"
        And I fill in "Amount" with "7.5"
        And I select "cup" from "Unit"
        And I fill in "Name of Item" with "dry cat food"
        And I press "Create"
      Then I should see "4 cups of Dry Cat Food"
        And I should see "7.5 cups of Dry Cat Food"

      When I press "Consolidate list"
        Then I should see "11.5 cups of Dry Cat Food"
