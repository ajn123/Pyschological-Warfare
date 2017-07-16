require 'rails_helper'


RSpec.describe Article, type: :model do 



	describe 'validations' do
		it 'requires email correctly' do 
				article = Article.create(title: "hello World")
		end




	end

end