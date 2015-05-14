Feature: Retrieve API data related to 'Comics'

  In order to start playing with the Marvel Comics API
  As an Application Designer and Builder
  I want access to data related to comic book titles

Scenario: App fetches all comic data the API has to offer
    Given I want to use data relating to comic titles
    When I make a call to the API
    Then I should receive everything they have
