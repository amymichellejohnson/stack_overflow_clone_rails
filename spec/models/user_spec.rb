require 'rails_helper'

describe User do

  it { should validate_presence_of :email }
  it {should have_many :questions }
  it {should have_many :answers }
  it {should have_many :votes }


  describe 'encrypt_password' do
    it 'creates a user with an email and password' do
      user = FactoryGirl.create(:user)
      expect(user.save).to eq(true)
    end
  end

  describe '.authenticate' do
    it 'logs in a user with a password and fails on incorrect password' do
      user = FactoryGirl.create(:user)
      expect(User.authenticate("dogdog@dog.dog", "dog")).to eq(user)
      expect(User.authenticate("dogdog@dog.dog", "cat")).to eq(nil)
    end
  end

  describe '#voted?' do
    it 'returns true when user has voted for a particular answer' do
      answer = FactoryGirl.create(:answer)
      test_user1 = User.create(:email => "catburgler@cat.cat", :password => "goodfood")
      test_user2 = User.create(:email => "amy@amy.com", :password => "amy")
      Vote.create(:answer_id => answer.id, :user_id => test_user1.id)
      expect(test_user1.voted?(answer)).to eq(true)
      expect(test_user2.voted?(answer)).to eq(false)
    end
  end
end
