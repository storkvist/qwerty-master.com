# frozen_string_literal: true

module Users
  # Actions that will run after authorization with OmniAuth.
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication

        if is_navigational_format?
          set_flash_message(:notice, :success, kind: 'GitHub')
        end
      else
        session['devise.github_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
