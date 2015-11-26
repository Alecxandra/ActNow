json.array!(@profiles) do |profile|
  json.extract! profile, :id, :photo, :first_name, :last_name, :about, :email, :phone_number
  json.url profile_url(profile, format: :json)
end
