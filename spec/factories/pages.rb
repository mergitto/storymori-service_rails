FactoryBot.define do
  factory :page do
    id { 1 }
    name { "Hiro" }
    text { "Test1" }
    story_id { 1 }
    parent_id { nil }
  end
end
