require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include ActiveModel::Validations

  validates :email, :first_name, :last_name, :sex, presence: true

  validates :email, presence: { case_sensitive: false }
  validates :email,
            :length => { :maximum => 30, :message => "Must be less than 30 characters"}


  validates :first_name,
            :length => { :maximum => 100, :message => "Must be less than 100 characters"}
  validates :first_name,  presence: { case_sensitive: false }
  
  validates :last_name, presence: { case_sensitive: false }
  validates :last_name,
            :length => { :maximum => 100, :message => "Must be less than 100 characters"}
end
