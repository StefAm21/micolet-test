# MICOLET TEST
The following project has been created entirely by [Stefano Amodei](https://www.linkedin.com/in/stefano-amodei/), here is how step by step you can get the app up and running:

### REQUIREMENTS
---

- rails -v 7.0.4.3
- ruby -v 3.1.2
- rspec -v 3.12
- rails-i18n -v 7.0.0
- letter_opener
- bootstrap


### How to execute in DEVELOPMENT
---
In order to run locally, follow this steps in your terminal:

1. Clone the repository to your computer
  - Using SSH: `git clone git@github.com:StefAm21/micolet-test.git`
  - Using GitHub CLI: `gh repo clone StefAm21/micolet-test`

2. Jump into the project folder: `cd micolet-test`

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
![db-micolet-arc](https://github.com/StefAm21/micolet-test/assets/80965786/1d093150-6357-40d5-81d5-4562df9a201f)

Reasoning behind this Model architecture:
- User: ?
  - email
  - password
- Campaign: ?
  - name
- Preference:?

- Subscriber_answer:

### TESTING
---
This project includes a test written in [RSpec](https://github.com/rspec/rspec-rails). Please, make sure you have **RSpec** installed and run the following command: `bundle exec rspec`.

You can run the tests with: `bundle exec rspec spec/models/subscriber_spec.rb`

**Special remarks:**
- ⚠️Test coverage is X%.
- ℹ️ I've decided only to have an integration test the process of....
- ❓Coverage includes...., but no controllers or views. Also, there are no integration tests.

### STAGING
---
This project has no staging enviroment at the moment.
ℹ️ You can request enviroment variables at stephano@gmail.com

### PRODUCTION
---
The latest version of this application is available at [https://micolet-test.herokuapp.com/](https://dataprop-assigment.herokuapp.com/). **Please note that this is a live version in a production environment.**

ℹ️ You can request enviroment variables at stephano@gmail.com


### Bug Report
---
If you would like to contribute to this project, email me, or create an issue.
