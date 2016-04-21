json.array!(@pictures) do |picture|
  json.extract! picture, :id, :title, :image
  json.url picture_url(picture, format: :json)
end
