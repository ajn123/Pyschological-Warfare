class HardWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical'

  def perform(user)
  	UserMailer.welcome_email(user.email).deliver_later
    subscribe(user)
    
  end


  # Does not work in production
  def subscribe(user)
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id = Rails.application.secrets.mailchimp_list_id
    result = mailchimp.lists(list_id).members.create(
      body: {
        email_address: user.email,
        status: 'subscribed',
        merge_fields: { FNAME: user.name, LNAME: "" }
    })
  end
end

