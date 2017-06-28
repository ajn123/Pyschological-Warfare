class HomeController < ApplicationController
  def index
    @social = {"twitter": "Tweet", "facebook": "Share", "mail": "E-mail"}
  end
end
