json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :photo, :place, :importance, :state, :counter
  json.url post_url(post, format: :json)
end
