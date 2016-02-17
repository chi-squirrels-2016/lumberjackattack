tiffany = User.create!(email: "tiffany@mail.com", password: "password", username: "Lumberjackin_Tiffany")
lauren = User.create!(email: "lauren@mail.com", password: "password", username: "Lumberjackin_Lauren")
james = User.create!(email: "james@mail.com", password: "password", username: "Lumberjackin_James")
sabri = User.create!(email: "sabri@mail.com", password: "password", username: "Lumberjackin_Sabri")
meagan = User.create!(email: "meagan@mail.com", password: "password", username: "Lumberjackin_Meagan")


question1 = Question.create!(title: "How do you shave your beard in the dark?", content: "Seriously guys, I can't see anything", user_id: 1)
question2 = Question.create!(title: "How do you shave your legs in the dark?", content: "Seriously guys, I still can't see anything", user_id: 1)
question3 = Question.create!(title: "How do you shave your dog in the dark?", content: "Seriously guys, I really need to shave my dog", user_id: 1)
question4 = Question.create!(title: "How many trees should I chop down in a day?", content: "Like if I cut down 10 trees is it enough?", user_id: 2)
question5 = Question.create!(title: "How many trees should I chop down in a week?", content: "I can cut down an entire forest in a week", user_id: 2)
question6 = Question.create!(title: "Who is going to go to prom with me?", content: "I feel like no one is going to ask me to prom", user_id: 3)
question7 = Question.create!(title: "Why does it smell like burrito at DBC right now?", content: "It smells so gross. Like so gross.", user_id: 4)
question8 = Question.create!(title: "Why are there so few lumberjacking questions on this website?!?!?!", content: "Why don't these people post their problems somewhere else?!?? OMFG", user_id: 5)


answer1 = Answer.create!(user_id: 5, content: "This is not a very good question. It is very easy to shave your beard in the dark.", question_id: 1)
answer2 = Answer.create!(user_id: 4, content: "I agree with you. I can't see anything as well. OMG so frustrating.", question_id: 1)
answer3 = Answer.create!(user_id: 3, content: "You probably should just make a fire so you can see your beard.", question_id: 1)
answer4 = Answer.create!(user_id: 5, content: "You should chop down at least a football field of trees every single day. Like every day. No doubt", question_id: 4)
answer5 = Answer.create!(user_id: 4, content: "I wish I was a little bit taller, I wish I was a baller, I wish I had a girl who looked good I would call her.", question_id: 4)
answer6 = Answer.create!(user_id: 3, content: "You cut down so many trees in a day that's so good but you should cut down more you're never doing enough omg why can't you cut down more trees", question_id: 4)
answer7 = Answer.create!(user_id: 1, content: "OMG I Will go TO PROM WITH YOU!!!!!", question_id: 6)
answer8 = Answer.create!(user_id: 2, content: "Because people are sweating.", question_id: 7)
answer9 = Answer.create!(user_id: 5, content: "People need to start asking better questions. AMIRITE?!?!", question_id: 8)

