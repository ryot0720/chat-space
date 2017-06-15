FactoryGirl.define do
  factory :message do
    text     { Faker::Lorem.sentence}
    avatar   { fixture_file_upload("spec/fixtures/スクリーンショット 2017-06-07 11.53.11.png", "avatar/jpeg") }
  end
end
