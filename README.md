# Nūish Backend Rails

This application allows dietitians to easily access formulary diets. In a day-to-day work life all dietitians that work with patients that are on tube feed, whether they are in the hospital or working in long-term care, look up different tube feeding formulas through a multiple booklets, or pamphlets depending on the brand. Below this an example of one of the many booklets that the dietitian review (notice that you are not able to easily find information when you select command + F). This application allows dietitians to easily filter through formula by formula type (specialty or standard), allergy specifications, and MCT oil percentages, as well as a global search for any other specifications.

Nūrish was built using Ruby on Rails and PostgreSQL for data storage.

Ruby version 2.4.1 and Rails version 2.5.1

## Initial Setup for Backend

1. Clone this repository and rename the repository to `nurish_be` in one command

2. Change directory into the `nurish_be` directory

3. Install the dependencies

  ```shell
  bundle install
  ```

3. Set up the database

  ```shell
  rake db:{create,migrate,seed}
  ```

4. Run test suite

  ```shell
    rspec
  ```

## Running the Server Locally for Backend

To see your code in action locally, you need to fire up a development server. Use the command:

```shell
rails s
