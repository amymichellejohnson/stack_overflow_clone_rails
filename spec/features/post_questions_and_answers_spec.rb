require 'rails_helper'

describe "the post questions process" do
  it 'creates a question' do
    visit "/"
    click_on 'Ask a Question'
    fill_in 'Question', :with => 'How to Be a Dog?'
    click_on 'Create Question'
    expect(page).to have_content "successfully"
  end
end
