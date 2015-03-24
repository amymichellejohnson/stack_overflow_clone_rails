require "rails_helper"
describe "the vote for the question owners favorite answer process" do
  it 'displays a star next to answers that belong to a users question' do
    answer = FactoryGirl.create(:answer)
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => "dogdog@dog.dog"
    fill_in 'Password', :with => "dog"
    click_on 'Log in'
    expect(page).to have_content "Star"
  end
  it 'lets an owner choose their favorite question by clicking it' do
    answer = FactoryGirl.create(:answer)
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => "dogdog@dog.dog"
    fill_in 'Password', :with => "dog"
    click_on 'Log in'
    click_on 'Star'
    expect(page).to have_content "successfully"
  end


end
