require 'rails_helper'


RSpec.describe Article, type: :model do 



	describe 'validations' do


		it 'not be valid, missing embedded_link' do 
        article = Article.new
				expect(article).to_not be_valid
		end

	#	it 'be valid, missing embedded_link' do 
	#			article1 = Article.create(title: "hello World", embedded_link: "http://www.google.com", )
	#			expect(article1).to be_valid
	#	end


		it 'works with one article tagging' do 
				article1 = Article.create(title: "hello World", embedded_link: "http://www.google.com", published: true)
				article1.add_tag("Inspiration")

				article2 = Article.create(title: "hello World", embedded_link: "http://www.gooeougle.com", published: true)
				article2.add_tag("Inspiration")

				article3 = Article.create(title: "hello World", embedded_link: "http://www.gooeooooogle.com", published: true)
				article3.add_tag("Inspiration")

				expect(article1.recommended_articles.count).to eq(2)

		end


		it 'works with multiple article tagging' do 

				article1 = Article.create(title: "hello World", embedded_link: "http://www.google.com", published: true)
				article1.add_tag("Inspiration")
				article1.add_tag("Physical")

				article2 = Article.create(title: "hello World", embedded_link: "http://www.gooeougle.com", published: true)
				article2.add_tag("Inspiration")

				article3 = Article.create(title: "hello World", embedded_link: "http://www.gooeooooogle.com", published: true)
				article3.add_tag("Inspiration")

				article4 = Article.create(title: "hello World", embedded_link: "http://www.gooeeeooooogle.com", published: true)
				article4.add_tag("Physical")

				expect(article1.recommended_articles.count).to eq(3)

		end




	end

end
