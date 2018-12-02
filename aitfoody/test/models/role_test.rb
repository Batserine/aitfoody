require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include ActiveModel::Validations

  validates :name, presence: true
  # validates :name, uniqueness: true
  validates :name, presence: { case_sensitive: false }
  validates :name,
            :length => { :maximum => 10, :message => "Must be less than 10 characters"}
end
