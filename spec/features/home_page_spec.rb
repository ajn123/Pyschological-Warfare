require 'rails_helper'
require_relative "../support/contact_form"

feature	"home page" do 

let(:contact_form) { ContactForm.new }

  scenario "Welcome" do 
  		visit("/")
  		expect(page).to have_content("Psychological Warfare")   
  end


  scenario "About" do 
  		visit("/home/contact")
  		expect(page).to have_content("aj@psychowarfare.com")
  end


feature "Sign Up", js: true do

#	scenario "Correct Sign UP" do 
#		
#		expect(User.count).to eq(0)
#		contact_form.visit_page.fill_in_with.submit
#		expect(page).to have_content("Thanks for signing up! ")
#		expect(User.count).to eq(1)
#		
#	end

	scenario "Invalid Sign UP" do 
		expect(User.count).to eq(0)
		contact_form.visit_page.fill_in_with(email: "wrongEMAIL").submit
#	expect(page).to have_content("Oops! Click here to try Again")		
		expect(User.count).to eq(0)
	end
end


end
