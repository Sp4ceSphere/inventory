# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EquipmentType.create(name: 'Hard Drives', description: 'SATA and IDE Hard Drives')
EquipmentType.create(name: 'Motherboards', description: 'Extra Server Motherboards')
EquipmentType.create(name: 'Mice', description: 'USB Mice')
EquipmentType.create(name: 'Keyboards', description: 'USB Keyboards')
EquipmentType.create(name: 'Monitors', description: 'Monitors (DVI compatible only)')
