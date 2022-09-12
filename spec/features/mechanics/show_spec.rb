require 'rails_helper'

RSpec.describe 'the Mechanic show' do
  before :each do
    @ricky = Mechanic.create!(name: "Ricky", years_of_experience: 7)
    @randy = Mechanic.create!(name: "Randy", years_of_experience: 10)
    visit "/mechanics/#{@ricky.id}"
  end

  it 'displays a mechanics name, years of experience, and the rides they are working on' do
    
    # save_and_open_page
  end


end