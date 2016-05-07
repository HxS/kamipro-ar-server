json.array!(@advertisings) do |advertising|
  json.extract! advertising, :id, :company_id, :image_url, :link_url
  json.url advertising_url(advertising, format: :json)
end
