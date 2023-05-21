# MICOLET TEST
The following project is a solved test from [Micolet](https://github.com/ecommerce-ventures/Micolet-Coding-challenge/blob/main/micolet-challenge-en.md) and has been created entirely by [Stefano Amodei](https://www.linkedin.com/in/stefano-amodei/), here is how step by step you can get the app up and running:

### REQUIREMENTS
---

- rails -v 7.0.4.3
- ruby -v 3.1.2
- rspec -v 3.12
- rails-i18n -v 7.0.0
- letter_opener -v 1.8.1
- bootstrap -v 5.2


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

**Special remarks:**
In this Micolet-test, Ball 1 (connecting to API to validate emails) and Ball 2 (adding i18n) was solved in only one way.

Ball 3 (completing survey to get a discount coupon), which was optional, was solved in two different ways:
- Firstly using Typeform's API connected with an ngrok server during development, to be able to test their webhook response, and Heroku in production: [https://micolet-test.herokuapp.com/](https://micolet-test.herokuapp.com/).

#### Architecture Database with Typeform Ball 3:
![db-micolet-arc](https://github.com/StefAm21/micolet-test/assets/80965786/1d093150-6357-40d5-81d5-4562df9a201f)

Reasoning behind this Model architecture:
- Subscriber: subscriber has many campaigns through Preference
  - email
  - coupon
- Campaign
  - name
- Preference (Join Table Subscriber/Campaigns)
- Subscriber_answer
  - subscribers_id
  - description
  - typeform_question_preference

- The second way of solving Ball 3 was with the creation of 2 extra models: Answer and Question.
In order to access this other way please go to the "feat-alternative-survey" branch. This way has no production environment, you can only acces to it locally in your Terminal:
  1. Change branch: `git co feat-alternative-survey`
  2. Spin your server: `rails s` and then in other terminal run JS: `yarn build --watch`

#### Architecture Database with Models "question" and "answer" Ball 3:
![db2-micolet](https://github.com/StefAm21/micolet-test/assets/80965786/b16064ea-455a-4669-a2bc-30b31f51b823)

- Subscriber: subscriber has many campaigns through Preference
  - email
  - coupon
- Campaign
  - name
- Preference (Join Table Subscriber/Campaigns)
- Answer
  - content
- Question
  - title
  - description
  - order

### TESTING
---
This project includes a test written in [RSpec](https://github.com/rspec/rspec-rails). Please, make sure you have **RSpec** installed and run the following command: `bundle exec rspec`.

You can run the tests with: `bundle exec rspec spec/models/subscriber_spec.rb`

### STAGING
---
This project has no staging enviroment at the moment.
ℹ️ You can request enviroment variables at stephano@gmail.com

### PRODUCTION
---
The latest version of this application solved with Typeform survey is available at [https://micolet-test.herokuapp.com/](https://micolet-test.herokuapp.com/). **Please note that this is a live version in a production environment.**. This version was deployed live so that it would be easier to connect typeform's webhook, without the need to share a different ngrok address every time.

ℹ️ You can request enviroment variables at stephano@gmail.com


### Bug Report
---
If you would like to contribute to this project, email me, or create an issue.
