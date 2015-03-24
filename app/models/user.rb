class User < ActiveRecord::Base
  validates :email, :presence => true
  has_many :questions
  has_many :answers
  has_many :votes
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end


  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def voted?(answer)
    answer.votes.each do |vote|
      if vote.user_id == self.id
        return true
      end
    end
    return false
  end



end
