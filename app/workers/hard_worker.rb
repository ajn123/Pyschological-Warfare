class HardWorker
  include Sidekiq::Worker

  def perform(name)
  	puts "hello"
  	UserMailer.welcome_email(@new_user).deliver_now
  end
end
