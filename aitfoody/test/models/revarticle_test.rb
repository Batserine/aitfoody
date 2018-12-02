require 'test_helper'

class RevarticleTest < ActiveSupport::TestCase
 
  include Devise::Test::IntegrationHelpers
  include ActiveModel::Validations

  attr_reader :user
  
  validates :title, 
            :presence => {:message => "Title can't be blank." },
            :length => { :maximum => 100, :message => "Must be less than 100 characters"}

  validates :content, 
            :presence => {:message => "Content can't be blank." },
            :length => { :maximum => 1000, :message => "Must be less than 1000 characters"}
  
  validates :rating, 
            :presence => {:message => "Rating can't be blank." },
            :length => { :maximum => 1, :message => "Must be less than 1 characters"}

  validates :price, 
            :presence => {:message => "Price can't be blank." },
            :length => { :maximum => 4, :message => "Must be less than 4 characters"}
  
  validates :typefood, 
            :presence => {:message => "Type of food can't be blank." },
            :length => { :maximum => 100, :message => "Must be less than 100 characters"}
end
