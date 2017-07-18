class HardWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical'

  def perform(user)
  	UserMailer.welcome_email(user[1]).deliver_later
    subscribe(user)  
  end


  # Does not work in production
  def subscribe(user)
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id = Rails.application.secrets.mailchimp_list_id
    result = mailchimp.lists(list_id).members.create(
      body: {
        email_address: user[1],
        status: 'subscribed',
        merge_fields: { FNAME: user[0], LNAME: "" }
      }
    )
  end
end

