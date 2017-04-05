# frozen_string_literal: true

# Base model class for application.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
