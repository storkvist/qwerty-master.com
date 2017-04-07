# frozen_string_literal: true

# Model for User.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.email = auth.info.email
      u.password = Devise.friendly_token[0, 10]
    end

    find_by(email: auth.info.email) unless user.persisted?
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.github_data'])
        user.email = data['info']['email'] if user.email.blank?
      end
    end
  end
end
