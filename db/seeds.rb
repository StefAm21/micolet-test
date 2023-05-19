# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# CAMPAIGNS
Campaign.create!(name:"women")
Campaign.create!(name:"men")
Campaign.create!(name:"children")

# QUESTIONS
Question.create!(title: 'full_name', description: 'Enter your full name', order: 1)
Question.create!(title: 'birth', description: 'Enter your birthdate', order: 2)
Question.create!(title: 'city', description: 'Enter your city', order: 3)

# ANSWERS
# Answer.create!(content: 'John Doe', subscriber_id: 1, question_id: question1.id)
# Answer.create!(content: '1990-01-01', subscriber_id: 1, question_id: question2.id)
# Answer.create!(content: 'New York', subscriber_id: 1, question_id: question3.id)
