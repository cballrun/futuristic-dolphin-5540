require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_of_experience}
  end

  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end


  describe 'class methods' do
    before :each do
      @ricky = Mechanic.create!(name: "Ricky", years_of_experience: 7)
      @randy = Mechanic.create!(name: "Randy", years_of_experience: 10)
    end
  
    it 'can tell the average years of experience for all mechanics' do
      expect(Mechanic.average_years_exp).to eq(8.5)
    end
  end

end