require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :db do
  desc "Generate a new blog post markdown"
    task new_article: :environment do
    cp 'lib/assets/articles/template.md', "lib/assets/articles/NEW_ARTICLE#{Time.now.strftime("%s")}.md"
    puts 'new article created!'
  end

   task populate: :environment do
    Article.destroy_all

    puts Dir.pwd
    a = File.join("lib", "assets", "articles", "*.md")
    Dir.glob(a).reject { |name| /.*(template|NEW_ARTICLE).*/ =~ name }.each do |file|
      File.open(file, "r") do |f|
        contents = f.read
        mkdown = Metadown.render(contents)
        md = mkdown.metadata
        
        unrendered_content = contents.sub(/^---(\n|.)*---/, '')
        #puts unrendered_content


        article = Article.create!(title: md["title"],
                        content: markdown(unrendered_content),
                        published: md["published"],
                        useful_links: md["useful_links"],
                        people_mentioned: md["people_mentioned"],
                        user: User.first)


        article.add_tag(md["tags"])

        puts article.useful_links
        puts article.people_mentioned

      end
    end
    
    puts "Article Count: #{Article.count}"
  end



end
