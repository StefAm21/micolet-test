# MICOLET TEST
The following project is a solved test from [Micolet](https://github.com/ecommerce-ventures/Micolet-Coding-challenge/blob/main/micolet-challenge-en.md) and has been created by [Stefano Amodei](https://www.linkedin.com/in/stefano-amodei/).

Here is how step by step you can get the app up and running:

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
  
  Or,
  
  - Using GitHub CLI: `gh repo clone StefAm21/micolet-test`

2. Jump into the project's folder: `cd micolet-test`

3. Run the setup configuration:
  - Install all gems: `bundle install`
  - Add JS packages to project: `yarn`
  - Create local database: `rails db:create`
  - Migrate (create database structure): `rails db:migrate`
  - Add fake data as playground: `rails db:seed`
  - Spin your server: `rails s`
  - Open a second terminal and run JS: `yarn build --watch`
  - To test email delivery on development environment, while spinning the server you can go to [http://localhost:3000/letter_opener/](http://localhost:3000/letter_opener/)

#**Special remarks:**

 Ball 1 and Ball 2 were solved in only one way. So you can test it either on development or in production.

But Ball 3 was solved in **2 different ways**:
- **First version:** using Typeform's API connected with an ngrok server during development, to be able to test their webhook response, and pushed to Heroku in production: [https://micolet-test.herokuapp.com/](https://micolet-test.herokuapp.com/). This version was deployed live so that it would be easier to connect Typeform's webhook, without the need to share a different ngrok address every time.
You can test this version on Heroku, but this version will not be sending mails after you are subscribed (the letter opener mencioned before is only available on a development environment or with an ngrok server live of the `localhost:3000`).

- **Second Version:** I created 2 extra models: Answer and Question, and did the survey on the backend with rails, **WITHOUT** the use of [Typeform](https://www.typeform.com/).

In order to access this second version please go to the "feat-alternative-survey" branch. This version has not been pushed to Heroku, you can only access it locally:

  1. Fetch branches and change branch: `git checkout feat-alternative-survey`
  2. Spin your server: `rails s` and then in other terminal run JS: `yarn build --watch`
  
 This branch is to test the second version locally, and the way I recommend you to test the app.
 
So to be clear to test first version, go to [Heroku](https://micolet-test.herokuapp.com/).
To test second version, test it locally spinning the server on the proper branch: `feat-alternative-survey`. 

#### First version Architecture Database with Typeform Ball 3:
(Go to the production environment in [https://micolet-test.herokuapp.com/](https://micolet-test.herokuapp.com/))
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

#### Second version: Architecture Database with Models "question" and "answer" Ball 3:
(In development environment, in your Terminal  go to `git checkout feat-alternative-survey`)
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

You can run the test with: `bundle exec rspec spec/models/subscriber_spec.rb`

### STAGING
---
This project has no staging enviroment at the moment.

ℹ️ You can request enviroment variables at stephano@gmail.com

### PRODUCTION
---
The latest version of this application **solved with [Typeform](https://www.typeform.com/) survey** is available at [https://micolet-test.herokuapp.com/](https://micolet-test.herokuapp.com/). **Please note that this is a live version in a production environment, once subscribed it will not send mails.**

ℹ️ You can request enviroment variables at stephano@gmail.com


### Bug Report
---
If you would like to contribute to this project, email me, or create an issue.
