require 'rails_helper'

feature 'endorsing reviews' do 
	before do
		nandos = Restaurant.create(name: 'Nandos')
		nandos.reviews.create(rating: 3, thoughts: 'It was fine')
		visit '/restaurants'
	end

	scenario 'a restuarnat has no endorsements when created' do
		expect(page).to have_content("0 endorsements")
	end


	it 'a user can endorse a review, which increments the endorsement count', js: true do
		click_link 'Endorse'
		expect(page).to have_content("1 endorsement")
	end
end