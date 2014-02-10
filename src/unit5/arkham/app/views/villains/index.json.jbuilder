json.array!(@villains) do |villain|
  json.extract! villain, :id, :name, :gender, :intel, :str, :speed, :durab, :power, :combat, :image_url
  json.url villain_url(villain, format: :json)
end
