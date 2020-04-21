json.guest do 
  json.extract! @guest, :name, :age, :favorite_color
  json.gifts do 
    json.array! @guest.gifts, :title, :description, :guest_id
  end
end