json.array!(@staffs) do |staff|
  json.extract! staff, :id, :company_id, :email, :password, :password_confirmation
  json.url staff_url(staff, format: :json)
end
