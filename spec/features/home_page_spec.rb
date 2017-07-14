require 'rails_helper'

feature	"home page" do 
  scenario "Welcome" do 
  		visit("/")
  		expect(page).to have_content("Psychological Warfare")
  end


  scenario "About" do 
  		visit("/home/contact")
  		expect(page).to have_content("aj@psychowarfare.com")
  end
end