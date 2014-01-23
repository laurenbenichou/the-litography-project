json.array!(@locations) do |location|
  json.extract! location, :id, :name, :lat, :lng, :location_type, :website_url, :short_text
  json.url location_url(location, format: :json)
end
