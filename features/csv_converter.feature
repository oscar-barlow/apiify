Feature: CsvConverter

  Scenario: File is bunny
    When I run `apiify get_file_name fixtures/bunny.csv`
    Then the output should contain "bunny"

  Scenario: File is bunny
    When I run `apiify get_file_name --csv_path fixtures/bunny.csv`
    Then the output should contain "bunny"
