require 'rails_helper'


RSpec.describe Article, type: :model do 



	describe 'validations' do


		it 'not be valid, missing embedded_link' do 
			
				article = Article.create(title: "hello World")
				expect(article).to_not be_valid
		end

		it 'not be valid, missing embedded_link' do 
				article1 = Article.create(title: "hello World", embedded_link: "http://www.google.com", )
				expect(article1).to be_valid
		end




	end

end