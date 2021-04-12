# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MachineSnack.destroy_all
Snack.destroy_all
Machine.destroy_all
Owner.destroy_all

burger = Snack.create!(label: 'White Castle Burger', price: 3.5 )
rocks = Snack.create!(label: 'Pop Rocks', price: 1.5 )
cheetos = Snack.create!(label: 'Flaming Hot Cheetos', price: 2.5 )
jerky = Snack.create!(label: 'Slim Jims Jerky', price: 2.0 )
apple = Snack.create!(label: 'Apple Slices', price: 2.75 )

dave = Owner.create!(name: 'Dave Thomas')
greg = Owner.create!(name: 'Greg Navas')
rec = dave.machines.create!(location: 'Rec Center')
lounge = dave.machines.create!(location: 'Student Lounge')

MachineSnack.create!(snack: burger, machine: rec)
MachineSnack.create!(snack: rocks, machine: rec)
rec.snacks << cheetos
rec.snacks << apple

cheetos.machines << lounge
jerky.machines << lounge
apple.machines << lounge
