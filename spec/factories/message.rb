FactoryGirl.define do

  factory :message do
    text     { Faker::Lorem.paragraph}
    avatar   { fixture_file_upload("spec/fixtures/スクリーンショット 2017-06-07 11.53.11.png", "avatar/jpeg") }
    group_id 40
    user_id  15
  end

end
