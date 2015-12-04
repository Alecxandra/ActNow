json.array!(@places) do |place|
  json.extract! place, :id, :latitud, :longitude
  json.url place_url(place, format: :json)
end
