FactoryGirl.define do
  factory(:question) do
    body('How to Be a Dog?')
    user
  end

  factory(:user) do
    email("dogdog@dog.dog")
    password("dog")

  end

  factory(:answer) do
    body('Scratch, Sniff and Sleep')
    question
  end

end
