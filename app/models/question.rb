class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :best_answer, class_name: "Answer"




# when we are on the individual question page
# there is a button that says "Best Answer?"
# when that button is clicked, we assign that_question.best_answer_id = answer.id

  #
# button is only available to current_user?


end
