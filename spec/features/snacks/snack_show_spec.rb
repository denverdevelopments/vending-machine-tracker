require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do

  before :each do
    @burger = Snack.create(label: 'White Castle Burger', price: 3.5 )
    @rocks = Snack.create(label: 'Pop Rocks', price: 1.5 )
    @cheetos = Snack.create(label: 'Flaming Hot Cheetos', price: 2.5 )
    @jerky = Snack.create(label: 'Slim Jims Jerky', price: 2.0 )
    @apple = Snack.create(label: 'Apple Slices', price: 2.75 )

    @dave = Owner.create(name: 'Dave Thomas')
    @lounge = @dave.machines.create(location: 'Student Lounge')
    @rec = @dave.machines.create(location: 'Rec Center')

    MachineSnack.create!(snack: burger, machine: rec)
    MachineSnack.create!(snack: rocks, machine: rec)
    @rec.snacks << @apple
    @rec.snacks << @cheetos
    @cheetos.machines << @lounge
    @jerky.machines << @lounge
    @apple.machines << @lounge
  end

  describe 'snack show page' do
    it "shows snack name and price" do
      visit "/snacks/#{@cheetos.id}"

      expect(page).to have_content("Flaming Hot Cheetos")
      expect(page).to have_content("$2.50")
    end

    it "shows list of locations with machines carrying that snack & " do
      visit "/snacks/#{@cheetos.id}"

      expect(page).to have_content("Student Lounge")
      expect(page).to have_content("Rec Center")
    end

    it "shows average price & count of snacks for snacks in those machines " do
      visit "/snacks/#{@cheetos.id}"

      # Flaming Hot Cheetos
      # Price: $2.50
      # Locations
      # * Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)
      # * Turing Basement (2 kinds of snacks, average price of $3.00)
    end
  end
end
