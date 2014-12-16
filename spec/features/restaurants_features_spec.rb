require 'rails_helper'

feature 'restaurants' do

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
  	before do
  		Restaurant.create(name: 'Nandos')
  	end

  	scenario 'display restaurants' do
  		visit '/restaurants'
  		expect(page).to have_content('Nandos')
  		expect(page).not_to have_content('No restaurants yet')
  	end
  end
end