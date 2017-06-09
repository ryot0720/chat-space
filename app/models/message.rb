class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :avatar, ImageUploader
  validates_presence_of :text||validates_presence_of :avatar
end
