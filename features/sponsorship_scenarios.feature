Feature: Sponsors
  In order to modify sponsorship connections as needed
  I want to be able to add sponsors to a given consultant

  Background: consultants
    Given there is a consultant named "Sophie" with employee ID "99991" who wants to learn "Ruby"
    Given there is a consultant named "Mridula" with employee ID "99992" who wants to learn "Groovy"
    Given there is a "Ruby" expert named "Derek" with employee ID "99993"
    Given there is a "Java" expert named "Vanessa" with employee ID "99994"

  Scenario: add a sponsor that is not on my recommended list of mentors
    Given I am on the consultant page for employee ID "99992"
    And I add "Vanessa" as a new sponsor
    Then I should see "Vanessa" show up as a mentor on the page
    When I click on "Vanessa"'s name
    And I click on the sponsorship tab
    Then I should see "Mridula" show up as a sponsee on the page

  Scenario: add a sponsor from the list of recommended mentors
    Given I am on the consultant page for employee ID "99991"
    When I click on the mentors tab
    And I click on the add sponsor button for "Derek"
    Then I should see "Derek" show up as a mentor on the page
    When I click on "Derek"'s name

  Scenario: show an error if I add a sponsor that doesnt exist
    Given I am on the consultant page for employee ID "99991"
    And I add "Ian" as a new sponsor
    Then I should see an error on the page

  Scenario: show an error if I add a blank sponsor name
    Given I am on the consultant page for employee ID "99991"
    And I add "" as a new sponsor
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
