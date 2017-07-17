class HardWorker
  include Sidekiq::Worker

  def perform(name)
  	puts "hellooeu@@@"
  	UserMailer.welcome_email(@new_user).deliver_now
  end
end
