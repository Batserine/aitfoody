json.extract! revarticle, :id, :title, :content, :rating, :price, :keywords, :location, :created_at, :updated_at
json.url revarticle_url(revarticle, format: :json)
