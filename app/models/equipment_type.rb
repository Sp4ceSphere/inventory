class EquipmentType < ActiveRecord::Base
   validates :name, presence: true

   has_many :equipment_items
end
