FactoryGirl.define do

  factory :message do
    text   "テキストテキスト"
    avatar { fixture_file_upload('/files/スクリーンショット 2017-06-12 17.10.49.png', 'avatar/png')}
  end

end
