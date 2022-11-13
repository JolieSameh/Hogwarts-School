json.extract! wizard, :id, :name, :email, :password, :house, :bio, :birthday, :relatives, :created_at, :updated_at
json.url wizard_url(wizard, format: :json)
