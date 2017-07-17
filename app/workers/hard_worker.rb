class HardWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical'

  def perform(name)
  	puts "hello"
  	UserMailer.welcome_email(name).deliver_later
  end
end
