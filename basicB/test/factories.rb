FactoryGirl.define do
  factory :user do
    email "#{Faker::Cat.name}.person@test.com"
    password "aaaaaa"
    # association :dash
  end

  factory :player do
    screenname "#{Faker::Name.name}"
  end
  
  factory :dash do
    name "#{Faker::Name.name}"
  end
  
  factory :dashplayer do
    dash_id {rand(9)}
    player_id {rand(9)}
  end
end

# FactoryGirl.define do
#   factory :relationship do
#     guardian
#     relationship_type RelationshipType.first

#     after(:build) do |relationship|
#       relationship.student = FactoryGirl.create(:student, school: relationship.guardian.school) unless relationship.student.present?
#     end
#   end
# end