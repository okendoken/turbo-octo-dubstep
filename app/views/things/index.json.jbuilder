json.array!(@things) do |thing|
  json.extract! thing, :name, :given, :description, :user_id
  json.url thing_url(thing, format: :json)
end
