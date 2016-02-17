class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  has_many :questions
  has_many :votes
  has_many :comments

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(username,password)
    self.username == username && self.password == password
  end

end
