Feature: Api

  Scenario: create a user
    Given url 'https://api.demoblaze.com/signup'
    And request {"username": "VivianaR", "password": "1234567890"}
    When method post
    Then status 200

  Scenario: create a user ready exist
    Given url 'https://api.demoblaze.com/signup'
    And request {"username": "VivianaR", "password": "1234567890"}
    When method post
    Then status 200
    And match $ == {"errorMessage": "This user already exist."}

  Scenario: login sucess
    Given url 'https://api.demoblaze.com/login'
    And request {"username": "VivianaR", "password": "1234567890"}
    When method post
    Then status 200

  Scenario: login fail
    Given url 'https://api.demoblaze.com/login'
    And request {"username": "VivianaR", "password": "12345678900"}
    When method post
    Then status 200
    And match $ == { "errorMessage": "Wrong password."}

