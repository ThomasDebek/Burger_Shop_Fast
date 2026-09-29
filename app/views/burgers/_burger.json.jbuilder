json.extract! burger, :id, :name, :price, :stock, :size, :created_at, :updated_at
json.url burger_url(burger, format: :json)
