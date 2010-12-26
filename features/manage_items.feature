Feature: Manage items
  In order to register new item
  As a user
  I want to add new item
  
  @javascript
  Scenario: Register new item
    Given I am logged in as "Bob"
    And I am on the root page
    And I follow "Users"
    And I follow "Bob"
    And I fill in "http://www.google.com" for "item_url"
    And I press "Add"
    Then I should see "Created an item"
    And I should have one item

