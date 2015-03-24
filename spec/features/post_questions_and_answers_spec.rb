require 'rails_helper'

describe "the post questions process" do
  it 'creates a question' do
    visit questions_path
    user = FactoryGirl.create(:user)
    click_on 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'Ask a Question'
    fill_in 'Question', :with => 'How to Be a Dog?'
    click_on 'Create Question'
    expect(page).to have_content "successfully"
    expect(page).to have_content "How to Be a Dog?"
  end

  it "returns an error if no question is added" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'Ask a Question'
    click_on 'Create Question'
    expect(page).to have_content "errors"
  end
end

describe "the post answer process" do
  it 'creates an answer' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    visit questions_path
    click_on 'Answer'
    fill_in 'Answer', :with => "Scratch, sniff and sleep"
    click_on 'Create Answer'
    expect(page).to have_content "successfully"
    expect(page).to have_content "Scratch, sniff and sleep"
  end

  it "returns an error if no answer is added" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit questions_path
    click_on 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    visit new_question_answer_path(question)
    click_on 'Create Answer'
    expect(page).to have_content "errors"
  end
end
