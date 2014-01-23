json.array!(@stories) do |story|
  json.extract! story, :id, :story_text, :tags, :location_id
  json.url story_url(story, format: :json)
end
