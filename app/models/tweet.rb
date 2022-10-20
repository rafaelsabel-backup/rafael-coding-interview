class Tweet < ApplicationRecord
  belongs_to :user

  scope :by_user, -> (username) { joins(:user).where(id: User.by_username(username).first&.id) if username.present? }
end
