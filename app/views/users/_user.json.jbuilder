json.extract! user, :id, :email, :verified_at, :email_confirmed, :name, :created_at, :updated_at
json.url user_url(user, format: :json)
