FactoryGirl.define do
  factory :user do
    email "#{Faker::Cat.name}.person@test.com"
    password "aaaaaa"
  end

  factory :player do
    screenname "#{Faker::Name.name}"
  end
  
  factory :dash do
    name "#{Faker::Name.name}"
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