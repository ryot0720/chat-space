require 'rails_helper'

describe Message do
  describe '#create' do

  #以下、messageを保存できる場合
  #textがあれば保存できること
    it "is valid with a text" do
      message = build(:message, avatar: nil)
      message.valid?
      expect(message).to be_valid
    end

    #avatarがあれば保存できること
    it "is valid with an avatar" do
      message = build(:message, text: nil)
      message.valid?
      expect(message).to be_valid
    end

    #messageとavatar両方があれば保存できること
    it "is valid with a text and an avatar" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

    #以下、messageを保存できない場合
    #textもavatarもなければ保存できないこと
    it "is invalid without both a text and an avatar" do
      message = build(:message, text: nil, avatar: nil)
      message.valid?
      expect(message).not_to be_valid
    end

    #group_idがなければ保存できないこと
    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message).not_to be_valid
    end

    #user_idがなければ保存できないこと
    it "is invalid without an user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message).not_to be_valid
    end
  end
end
