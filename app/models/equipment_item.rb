class EquipmentItem < ActiveRecord::Base
   validates_presence_of :name, :serial, :purchase_date, :equipment_type_id, :user_id
   
   belongs_to :equipment_type
   belongs_to :user
end
