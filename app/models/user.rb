# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  validate :validate_icon
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def validate_icon
    return unless avatar.image?

    unless validate_extension
      avatar = nil
      errors.add(:avatar, I18n.t('errors.messages.file_type_not_image'))
    end
    avatar
  end

  def validate_extension
    %w[image/jpg image/gif image/png].include?(avatar.blob.content_type)
  end
end
