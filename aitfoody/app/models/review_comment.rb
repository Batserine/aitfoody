class ReviewComment < ApplicationRecord
  belongs_to :revarticle
  belongs_to :comment
end
