json.extract! contact, :id, :guest_name, :address, :phone, :buisness, :notes, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
