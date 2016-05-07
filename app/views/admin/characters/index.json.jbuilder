json.array!(@characters) do |character|
  json.extract! character, :id, :name, :asset_url, :thumbnail_url
  json.url character_url(character, format: :json)
end
