require 'rails_helper'

RSpec.describe 'the Mechanics index' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
   
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)

    @ricky = Mechanic.create!(name: "Ricky", years_of_experience: 7)
    @randy = Mechanic.create!(name: "Randy", years_of_experience: 10)

    visit "/mechanics"
  end

  it 'lists the names of all mechanics and their years of experience' do
    
    within("#mechanic_#{@ricky.id}") do
      expect(page).to have_content("Name: Ricky")
      expect(page).to have_content("Years of Experience: 7")
      expect(page).to_not have_content("Name: Randy")
    end
    
    within("#mechanic_#{@randy.id}") do

      expect(page).to have_content("Name: Randy")
      expect(page).to have_content("Years of Experience: 10")
      expect(page).to_not have_content("Name: Ricky")
    end

  end

  it 'shows the average years of experience across all mechanics' do
    expect(page).to have_content("Average Years of Experience for All Mechanics: 8.5")
  end
end