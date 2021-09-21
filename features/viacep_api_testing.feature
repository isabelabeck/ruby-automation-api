Feature: Test Automation of the ViaCEP API.

Scenario Outline: Verify valid zip codes 
    Given I want to verify a zip code "<zip_code>"
    When I use this API to verify the zip code 
    Then the address inside the result should be "<address>"
    Examples: 
    | zip_code    | address                    |
    | 40296390    | Alameda Monte Carmelo      |
    | 42708380    | Alameda Praia de Jaguaripe |
    | 41820500    | Alameda das Algarobas      |
    | 40450220    | Travessa Dois de Julho     |
    | 04533020    | Travessa Alex Vallauri     | 

   Scenario Outline: Verify invalid zip codes
        Given I want to verify a zip code "<invalid_zip_code>"
        When I use this API to verify the zip code
        Then the result should be HTTP error 400
        Examples:
    | invalid_zip_code |
    | 420340           |
    | 0                |


   Scenario Outline: Verify nonexistent zip codes
       Given I want to verify a zip code "<nonexistent_zip_code>"
       When I use this API to verify the zip code 
       Then the result should be error: true
       Examples:
      | nonexistent_zip_code | 
      | 42279020             |
      | 42579020             |
      | 42579320             |
      
   
