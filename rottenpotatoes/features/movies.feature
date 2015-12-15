Feature: add and delete movie

  As a movie buff
  So that I can update movies list
  I want to add new movie and delete some

  Background: movies in database

    Given I am on the movies page


  Scenario: add new movie to list
    When I follow "Add new movie"
    And  I fill in "Title" with "Jack Reacher"
    And  I fill in "Director" with "Tom Cruise"
    And  I select "PG-13" from "Rating"
    And  I press "Save Changes"
    Then the message "Jack Reacher was successfully created" is displayed


