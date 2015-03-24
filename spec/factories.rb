FactoryGirl.define do
  factory(:question) do
    body('How to Be a Dog?')
  end

  factory(:user) do
    email("dogdog@dog.dog")
    password("dog")
    id(10)
  end

end
