json.array!(@equipment_items) do |equipment_item|
  json.extract! equipment_item, :id, :name, :serial, :purchase_date, :comments, :equipment_type_id, :user_id
  json.url equipment_item_url(equipment_item, format: :json)
end
