require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #listen" do
    it "returns http success" do
      get :listen
      expect(response).to have_http_status(:success)
    end
  end

end
