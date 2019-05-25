FactoryBot.define do
  factory :goal do
    content { |n| Faker::Internet.email }
    details { |p| Faker::Internet.password }
    user_id { |u| 1}
    private { |r| true}
    completed { |c| false}
  end
end
