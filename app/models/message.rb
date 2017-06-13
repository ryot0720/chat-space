class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :avatar, AvatarUploader
  validates :text, presence: true, if: -> { avatar.blank? }
  validates :avatar, presence: true, if: -> { text.blank? }
  validates :group_id, presence: true
  validates :user_id, presence: true
end
