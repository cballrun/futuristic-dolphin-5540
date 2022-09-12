require 'rails_helper'

RSpec.describe 'the Mechanic show' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: true)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    
    @ricky = Mechanic.create!(name: "Ricky", years_of_experience: 7)
    @randy = Mechanic.create!(name: "Randy", years_of_experience: 10)
    
    @mr_1 = MechanicRide.create!(mechanic_id: @ricky.id, ride_id: @hurler.id)
    @mr_2 = MechanicRide.create!(mechanic_id: @ricky.id, ride_id: @scrambler.id)
    @mr_3 = MechanicRide.create!(mechanic_id: @randy.id, ride_id: @hurler.id)
    
    visit "/mechanics/#{@ricky.id}"
  end

  it 'displays a mechanics name, years of experience, and the rides they are working on' do

    expect(page).to have_content(@ricky.name)
    expect(page).to have_content(@ricky.years_of_experience)
    expect(page).to have_content(@hurler.name)
    
    expect(page).to_not have_content(@ferris.name)
    expect(page).to_not have_content(@randy.years_of_experience)
  end

  it 'lists rides by thrill rating in descending order' do
    within("#ride_0") do
      save_and_open_page
      expect(page).to have_content(@hurler.name)
      expect(page).to_not have_content(@scrambler.name)
    end

  end






end