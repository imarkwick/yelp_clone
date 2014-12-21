require 'rails_helper'

feature 'endorsing reviews' do 
	before do
		nandos = Restaurant.create(name: 'Nandos')
		nandos.reviews.create(rating: 3, thoughts: 'It was fine')
	end

	scenario 'a user can endorse a review, updating the review endorsement count' do
		visit '/restaurants'
		click_link 'Endorse Nandos'
		expect(page).to have_content('1 endorsement')
	end

	it 'a user can endorse a review, which increments the endorsement count', js: true do
		visit '/restaurants'
		click_link 'Endorse'
		expect(page).to have_content("1 endorsement")
	end
end