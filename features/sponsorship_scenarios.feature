Feature: Sponsors
  In order to modify sponsorship connections as needed
  I want to be able to add sponsors to a given consultant

  Background: consultants
    Given there is a consultant named "Sophie" with employee ID "99991"
    Given there is a consultant named "Mridula" with employee ID "99992"
    Given there is a Ruby expert named "Derek" with employee ID "99993"

  Scenario: add a sponsee from the mentor tab search box
    Given I am on the consultant page for employee ID "99991"
    And I add "Mridula" as a new sponsee
    And I click on the sponsorship tab
    Then I should see "Mridula" show up as a sponsee on the page

  Scenario: show an error if I add a consultant that doesnt exist
    Given I am on the consultant page for employee ID "99991"
    And I add "Ian" as a new sponsee
    And I click on the sponsorship tab
    Then I should see an error on the page

  Scenario: show an error if I add a blank consultant name
    Given I am on the consultant page for employee ID "99991"
    And I add "" as a new sponsee
    And I click on the sponsorship tab
    Then I should see an error on the page

  Scenario: delete a consultant
    Given there is a sponsorship between employee IDs "99992" and "99991"
    Given I am on the consultant page for employee ID "99992"
    When I click on the sponsorship tab
    Then I should see "Sophie" in the list of sponsees
    And I remove the first sponsee on their list of sponsees
    Then I should not see "Sophie" in the list of sponsees

  Scenario: add a sponsee from the mentee tab
    Given I am on the consultant page for employee ID "99993"
    When I click on the mentees tab
    And I click on the add sponsee button for "Sophie"
    When I click on the sponsorship tab
    Then I should see "Sophie" show up as a sponsee on the page

  Scenario: add a sponsor from the mentor tab
    Given I am on the consultant page for employee ID "99991"
    When I click on the mentors tab
    And I click on the add sponsor button for "Derek"
    When I click on "Derek"'s name
    And I click on the sponsorship tab
    Then I should see "Sophie" show up as a sponsee on the page