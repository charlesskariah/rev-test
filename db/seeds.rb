# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email: "charles@example.com", user_name: "blogger", active: true)
user2 = User.create(email: "sam@example.com", user_name: "youtube", active: true)

category1 = Category.create(name: "happy-vibe")
category2 = Category.create(name: "sad-vibe")

nudge1 = Nudge.create(name: "Rose means love", category_id: category1.id, 
          content: "In tarot, the rose is considered a symbol of balance. The beauty of this flower expresses promise, hope, and new beginnings. It is contrasted by thorns symbolizing defense, loss, and thoughtlessness. A yellow rose symbolizes joy, protection against envious lovers, and a mature love.",
          nudge_type: "text")
nudge2 = Nudge.create(name: "Seperated", category_id: category2.id, 
          content: "It is love that makes us capable of thinking that we can spend our life with someone; in all ups and downs of life; you want them there to be with you standing by your side like you want to stand by their side.",
          nudge_type: "text")
pattern1 = Pattern.create(name: "Registration", max_priority: 5)
pattern2 = Pattern.create(name: "Daily Question", max_priority: 1)


#only for multiple option question branching is possible 

q1 = Question.create(content: "What is your age?", branching: false , parent: true, question_type: "text")
q2 = Question.create(content: "What is your gender", branching: true , parent: true, question_type: "mutiple")
q3 = Question.create(content: "What is your marital status?", branching: false , parent: true, question_type: "multiple")
q4 = Question.create(content: "Pick one interested topic?", branching: true , parent: true, question_type: "mutiple")
q5 = Question.create(content: "Your email-id?", branching: false , parent: true, question_type: "text")
q6 = Question.create(content: "Do you have a daily workout plan?", branching: false, parent: false, question_type: "multiple")
q7 = Question.create(content: "How often you go to beauty parlour", branching: false, parent: false, question_type: "multiple")
q8 = Question.create(content: "Do you like romantic movies?", branching: false, parent: false, question_type: "multiple")
q9 = Question.create(content: "Do you watch porn movies?", branching: false, parent: false, question_type: "multiple") 
q10 = Question.create(content: "Do you sleep at day time?", branching: false, parent: false, question_type: "multiple") 
q11 = Question.create(content: "How are you doing today?", branching: false, parent: false, question_type: "multiple")

Option.create(name: "male", question_id: q2.id, next_question_id: q6.id)
Option.create(name: "female", question_id: q2.id, next_question_id: q7.id)

Option.create(name: "single", question_id: q3.id)
Option.create(name: "married", question_id: q3.id)
Option.create(name: "widowed", question_id: q3.id)

Option.create(name: "Romance", question_id: q4.id, next_question_id: q8.id)
Option.create(name: "Sex", question_id: q4.id, next_question_id: q9.id)
Option.create(name: "Sleeping", question_id: q4.id, next_question_id: q10.id)

Option.create(name: "Yes", question_id: q6.id)
Option.create(name: "No", question_id: q6.id)

Option.create(name: "Daily", question_id: q7.id)
Option.create(name: "Weekly", question_id: q7.id)
Option.create(name: "Monthly", question_id: q7.id)
Option.create(name: "Never", question_id: q7.id)

Option.create(name: "Yes", question_id: q8.id)
Option.create(name: "No", question_id: q8.id)
Option.create(name: "Sometimes", question_id: q8.id)

Option.create(name: "Yes", question_id: q9.id)
Option.create(name: "No", question_id: q9.id)

Option.create(name: "Yes", question_id: q10.id)
Option.create(name: "No", question_id: q11.id)

Option.create(name: "Happy", question_id: q11.id)
Option.create(name: "Sad", question_id: q11.id)
Option.create(name: "Nervous", question_id: q11.id)
Option.create(name: "Sleepy", question_id: q11.id)


pq1 = PatternQuestion.create(pattern_id: pattern1.id, question_id: q1.id, priority: 1)
pq2 = PatternQuestion.create(pattern_id: pattern1.id, question_id: q2.id, priority: 2)
pq3 = PatternQuestion.create(pattern_id: pattern1.id, question_id: q3.id, priority: 4)
pq4 = PatternQuestion.create(pattern_id: pattern1.id, question_id: q4.id, priority: 3)
pq5 = PatternQuestion.create(pattern_id: pattern1.id, question_id: q5.id, priority: 5)

pq6 = PatternQuestion.create(pattern_id: pattern2.id, question_id: q11.id, priority: 1)