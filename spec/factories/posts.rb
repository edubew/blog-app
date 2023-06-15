FactoryBot.define do
  factory :post do
    title { 'MyString' }
    text { 'MyString' }
    comments_counter { 1 }
    likes_counter { 1 }
  end
end
