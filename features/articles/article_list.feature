Feature: List Articles
  As a visitor to the website
  I want to see articles listed on the homepage
  so I can know if the site has articles

    Scenario: Viewing Articles
      Given I am not logged in
      And I have created 10 articles
      When I go to the homepage
      Then I should see "Login"
      And I should see 10 articles

