require 'rails_helper'

describe "the registration process" do
  it 'creates a new user' do
    visit questions_path
    click_on 'New User'
    fill_in 'email', :with => 'Dogdog@dog.dog'
    fill_in 'password', :with => 'IloveBones'
    fill_in 'password_confirmation', :with => 'IloveBones'
    click_on 'Create User'
    expect(page).to have_content "successfully"
    expect(page).to have_content "Dogdog@dog.dog"
  end
end
