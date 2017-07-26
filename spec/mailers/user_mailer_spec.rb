require "rails_helper"

RSpec.describe UserMailer, type: :mailer do



  describe "User mailer Works" do

  	email = UserMailer.welcome_email(User.create(name: "Alex", email: "bob@aol.com"))

  	it "sends the email" do
  	 expect(email.to).to eq(["aj@psychowarfare.com"])

		end



  it 'sends an email' do
    expect { email.deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  	end
  end

end
