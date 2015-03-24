require 'rails_helper'

describe "the registration process" do
  it 'creates a new user' do
    visit questions_path
    click_on 'New User'
    fill_in 'Email', :with => 'dogdog@dog.dog'
    fill_in 'Password', :with => 'IloveBones'
    fill_in 'Password confirmation', :with => 'IloveBones'
    click_on 'Create User'
    expect(page).to have_content "Successfully"
  end

  it 'log in an existing user' do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    expect(page).to have_content "Successfully"
  end

  it 'hides the New User and Log in options when logged in' do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    expect(page).not_to have_content "Log in"
    expect(page).not_to have_content "New User"
  end

  it 'hides the New User and Log in options when logged in' do
    visit questions_path
    expect(page).not_to have_content "Ask a Question"
    expect(page).not_to have_content "Answer"
    expect(page).not_to have_content "Log Out"
  end
end
