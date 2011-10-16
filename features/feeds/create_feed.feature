Feature: Create Feed
    In order to create an article i need to be logged in
    a user needs to be logged in and be able to create articles

    Scenario: Create feed
        Given I am signed in as "uaa@test.com/aaaaaa"
        Then I go to the home page
        When I follow "New Feed"
        And I fill in "Title" with "test"
        And I fill in "Url" with "http://www.google.com"
        And I fill in "feed_url" with "http://www.google.com"
        And I press "Save"
        When I follow "Feeds"
        Then I should see "test"

