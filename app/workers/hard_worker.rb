class HardWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical'

  def perform(name)
  	subscribe(name)
  	UserMailer.welcome_email(name).deliver_later
  end

  def subscribe(user)
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id = Rails.application.secrets.mailchimp_list_id
    result = mailchimp.lists(list_id).members.create(
      body: {
        email_address: user.email,
        status: 'subscribed'
    })
    Rails.logger.info("Subscribed #{user.email} to MailChimp") if result
  end
end
