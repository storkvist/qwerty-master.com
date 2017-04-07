# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#index'

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
