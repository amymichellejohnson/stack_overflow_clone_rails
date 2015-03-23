require 'rails_helper'

describe "the post questions process" do
  it 'creates a question' do
    visit questions_path
    click_on 'Ask a Question'
    fill_in 'Question', :with => 'How to Be a Dog?'
    click_on 'Create Question'
    expect(page).to have_content "successfully"
    expect(page).to have_content "How to Be a Dog?"
  end

  it "returns an error if no question is added" do
    visit questions_path
    click_on 'Ask a Question'
    click_on 'Create Question'
    expect(page).to have_content "errors"
  end


end

describe "the post answer process" do
  it 'creates an answer' do
    question = FactoryGirl.create(:question)
    visit questions_path
    click_on 'Answer'
    fill_in 'Answer', :with => "Scratch, sniff and sleep"
    click_on 'Create Answer'
    expect(page).to have_content "successfully"
    expect(page).to have_content "Scratch, sniff and sleep"
  end


end
