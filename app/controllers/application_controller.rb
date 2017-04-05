# frozen_string_literal: true

# Base application controller.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
