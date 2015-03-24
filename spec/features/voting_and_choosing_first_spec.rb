require "rails_helper"
describe "the vote for the question owners favorite answer process" do
  it 'sets answer as first' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer)
    answer.question_id = question.id
    question.user_id = user.id
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    expect(page).to have_content "Star"
  end
end
