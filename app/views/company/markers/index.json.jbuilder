json.array!(@markers) do |marker|
  json.extract! marker, :id, :company_id, :image_url
  json.url marker_url(marker, format: :json)
end
