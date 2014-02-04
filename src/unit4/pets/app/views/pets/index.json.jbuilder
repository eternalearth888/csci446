json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :gender, :intell, :strength, :speed, :durab, :power, :combat, :image_url
  json.url pet_url(pet, format: :json)
end
