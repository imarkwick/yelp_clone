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

  context 'creating restaurants' do
	  scenario 'prompts user to fill out a form, then displays the new restaurant' do
	    visit '/restaurants'
	    click_link 'Add a restaurant'
	    fill_in 'Name', with: 'Nandos'
	    click_button 'Create Restaurant'
	    expect(page).to have_content 'Nandos'
	    expect(current_path).to eq '/restaurants'
	  end
	end

	context 'viewing restaurants' do

  	let!(:nandos){Restaurant.create(name:'Nandos')}

	  scenario 'lets a user view a restaurant' do
	   visit '/restaurants'
	   click_link 'Nandos'
	   expect(page).to have_content 'Nandos'
	   expect(current_path).to eq "/restaurants/#{nandos.id}"
  	end
	end

	context 'editing restaurants' do

  	before {Restaurant.create name: 'KFC'}

	  scenario 'let a user edit a restaurant' do
	   visit '/restaurants'
	   click_link 'Edit KFC'
	   fill_in 'Name', with: 'Kentucky Fried Chicken'
	   click_button 'Update Restaurant'
	   expect(page).to have_content 'Kentucky Fried Chicken'
	   expect(current_path).to eq '/restaurants'
	  end
	end

	describe 'deleting restaurants' do

  	before {Restaurant.create name: 'KFC'}

  	scenario 'removes a restaurant when a user clicks a delete link' do
    	visit '/restaurants'
    	click_link 'Delete KFC'
    	expect(page).not_to have_content 'KFC'
	    expect(page).to have_content 'Restaurant deleted successfully'
  	end
	end
end