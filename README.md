# TIME LOGGER

This is a simple time logging web application written using Ruby ıon Rails framework version 6.x.

## Main Features of the App

- Users can sign up and log in using their credentials
- Users can log time records that include starting time, ending time, category and comment
- Admin users can pull reports such as;
  - Listing time records per user (reports can be limited to specific date ranges)
  - Listing time records according to the category

## Technologies Used

- Ruby 2.7.4
- Ruby on Rails 6.x
- Zurb Foundation for Sites (Sass version)
- HAML template language
- JQuery library
- PostgreSQL databse
- Other dependencies (ruby gems and js libraries) are listed on the `Gemfile` and `package.json` files

## How to Run the App

- Clone the repo
- Run `bundle install`
- App uses postgresql as the database. You need to install postgresql to run the app locally. Configuration details of how to run Rails using postgresql on a Ubuntu local machine can be found [at this link](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-18-04)

- A deployed running version can be found [here](https://fierce-badlands-52626.herokuapp.com/)
