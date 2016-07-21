json.array!(@demos) do |demo|
  json.extract! demo, :id, :age, :description
  json.url demo_url(demo, format: :json)
end
