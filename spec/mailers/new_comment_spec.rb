require "rails_helper"

RSpec.describe NewCommentMailer, type: :mailer do


    describe "User mailer Works" do

    	email = NewCommentMailer.new_comment_email(["AJ", "aj@vt.edu", "what are you doing", "title"])

    	it "sends the email" do
    	 expect(email.to).to eq(["aj@psychowarfare.com"])

  		end



    it 'sends an email' do
      expect { email.deliver_now }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
    	end
    end

end
