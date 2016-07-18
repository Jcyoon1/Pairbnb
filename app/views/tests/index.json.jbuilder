json.array!(@tests) do |test|
  json.extract! test, :id, :name, :bio, :age
  json.url test_url(test, format: :json)
end
