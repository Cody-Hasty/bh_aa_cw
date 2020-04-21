json.pokemon do
  json.extract! @pokemon, :name, :attack, :defense, :poke_type, :moves, :image_url, :item_ids
end

json.item do 
  @pokemon.items.each do |item|
    json.set! item.id do 
      json.extract! item, :pokemon_id, :name, :price, :happiness, :image_url
      json.pokemon item.pokemon.name
    end
  end
end