require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many(:machine_snacks) }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  before :each do
    @cheetos = Snack.create(label: 'Flaming Hot Cheetos', price: 2.5 )
    @jerky = Snack.create(label: 'Slim Jims Jerky', price: 2.0 )
    @apple = Snack.create(label: 'Apple Slices', price: 2.75 )

    @dave = Owner.create(name: 'Dave Thomas')
    @rec = @dave.machines.create(location: 'Rec Center')
  end

  describe 'instance methods' do
    it 'calculates average_price' do
      @jerky.machines << @rec
      @apple.machines << @rec
      @rec.snacks << @cheetos

      expect(@rec.average_price).to eq(0.24)
    end

    it 'calculates count_jakes_face' do
      @jerky.machines << @rec
      @apple.machines << @rec
      @rec.snacks << @cheetos

      expect(@rec.count_jakes_face).to eq(3)
    end
  end
end
