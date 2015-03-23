require 'rails_helper'

describe User do

  it { should validate_presence_of :email }
  it {should have_many :questions}
  it {should have_many :answers}


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
end
