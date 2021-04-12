require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before :each do
    @burger = Snack.create(label: 'White Castle Burger', price: 3.5 )
    @rocks = Snack.create(label: 'Pop Rocks', price: 1.5 )
    @cheetos = Snack.create(label: 'Flaming Hot Cheetos', price: 2.5 )
    @dave = Owner.create(name: 'Dave Thomas')
    @lounge = @dave.machines.create(location: 'Student Lounge')
  end

  scenario 'they see the location of that machine' do
    # owner = Owner.create(name: "Sam's Snacks")
    # dons  = owner.machines.create(location: "Don's Mixed Drinks")
    visit machine_path(@lounge)

    expect(page).to have_content("Student Lounge")
  end

  describe 'vending machine show page' do
    it "shows all snack names and prices for that machine" do
      visit "/machines/#{@dons.id}"

      expect(page).to have_content("White Castle Burger")
      expect(page).to have_content("$3.50")
      expect(page).to have_content("Pop Rocks")
      expect(page).to have_content("$1.50")
      expect(page).to have_content("Flaming Hot Cheetos")
      expect(page).to have_content("$2.50")
    end

    it "shows average price for all snacks in machine" do
      visit "/machines/#{@dons.id}"

      expect(page).to have_content("$2.50")
    end
  end

  #   Snacks
  # * White Castle Burger: $3.50
  # * Pop Rocks: $1.50
  # * Flaming Hot Cheetos: $2.50
  # Average Price: $2.50
end
