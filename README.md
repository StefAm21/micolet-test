# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


HERE IS THE TEMPLATE OF ANOTHER PROJECT AS A GUIDE:
# DATAPROP ASSIGNMENT
The following project has been generated with [Le Wagon's template](https://github.com/lewagon/rails-templates), created entirely by [Stefano Amodei](https://www.linkedin.com/in/stefano-amodei/), using [Le Wagon coding bootcamp](https://www.lewagon.com) components and resources: [Le Wagon UI KIT](https://uikit.lewagon.com/).

Special consideration take to be inspired by some [CodePen](https://codepen.io/your-work) CSS components and HTML.

### REQUIREMENTS
---

- rails -v 7.0.4.3
- ruby -v 3.1.2
- font awesome -v 6.1
- cloudinary -v 1.25.0
- pagy -v 6.0.4
- rspec -v 


### How to execute in DEVELOPMENT
---
In order to run locally, follow this steps in your terminal:

1. Clone the repository to your computer
  - Using SSH: `git clone git@github.com:StefAm21/dataprop-assigment.git`
  - Using GitHub CLI: `gh repo clone StefAm21/dataprop-assigment`

2. Jump into the project folder: `cd dataprop-assigment`

3. Run the setup configuration:
  - Install all gems: `bundle install`
  - Add JS packages to project: `yarn`
  - Create local database: `rails db:create`
  - Migrate (create database structure): `rails db:migrate`
  - Add fake data as playground: `rails db:seeds`
  - Spin your server: `rails s`
  - Open a second terminal and run JS: `yarn build --watch`

You can also run the server with only `dev`, but you need to XXXX... 


#### Architecture Database:
![Database](https://github.com/StefAm21/dataprop-assigment/assets/80965786/aaf8d9ef-a379-4bb1-871a-028bac1ff989)

Reasoning behind this Model architecture:
- User: ?
  - email
  - password
- Property: ?
  - xxxx

### TESTING
---
This project includes a test written in [RSpec](https://github.com/rspec/rspec-rails). Please, make sure you have **RSpec** installed and run the following command: `bundle exec rspec`.

You can run the tests with: `bundle exec rspec spec/models/property_spec.rb`

**Special remarks:**
- ⚠️Test coverage is 10%.
- ℹ️ Due to time shoratge, I've decided only to have an integration test the process of a User to create a Property.
- ❓Coverage includes User and Property models, but no controllers or views. Also, there are no integration tests.

### STAGING
---
This project has no staging enviroment at the moment.
ℹ️ You can request enviroment variables at stephano@gmail.com
