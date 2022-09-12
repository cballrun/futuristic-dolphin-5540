require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :thrill_rating}
    it {should validate_presence_of :open}
  end

  it 'sorts rides by thrill rating in descending order' do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)

    expect(Ride.thrill_sort).to eq([@hurler, @scrambler])
  end
end