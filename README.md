# Nūish Backend Rails

## Initial Setup

1. Clone this repository and rename the repository to `nurish_be` in one command

  ```shell
  https://your-github-username.github.io/nurish/index.html
  ```
2. Change directory into the `nurish_be` directory

3. Install the dependencies

  ```shell
  bundle
  ```

3. Set up the database

  ```shell
  rake db:create
  rake db:migrate
  rake db:seed
  ```

4. Run test suite

  ```shell
    rspec
  ```

## Running the Server Locally

To see your code in action locally, you need to fire up a development server. Use the command:

```shell
rails s
