require 'rails_helper'

RSpec.describe 'the Mechanics index' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
   
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)

    @ricky = Mechanic.create!(name: "Ricky", years_of_experience: 7)
    @randy = Mechanic.create!(name: "Randy", years_of_experience: 10)
  end

  it 'lists the names of all mechanics and their years of experience' do
    expect(page).to have_content(@ricky.name)
    expect(page).to have_content(@randy.name)
    expect(page).to have_content(@ricky.years_of_experience)
    expect(page).to have_content(@randy.years_of_experience)
  end

  xit 'shows the average years of experience across all mechanics' do
    
  end
end