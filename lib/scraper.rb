require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped_students = []
    ix_url = open(index_url)
    scrape_url = Nokogiri::HTML(ix_url)
   
    scrape_url.css(".student-card").each_with_index do |students, i| 
      
      profile_url = students.css("a").attr("href").value
      student_name = students.css(".student-name").text
      student_location = students.css(".student-location").text
      scraped_students << {:name => student_name, :location => student_location, :profile_url => profile_url}
   
    end
    scraped_students
  end

  def self.scrape_profile_page(profile_url)
    pf_url = open(profile_url)
    scrape_pf = Nokogiri::HTML(pf_url)
    
    student_name = scrape_pf.css(".profile-name").text
    
    info = []
    binding.pry
    scraped_student = {:name => student_name, }
  end

end
    # scrape_pf.css(".social-icon-container").each_with_index do |social, i|
    #   info << social.css("a").attr("href").text
      
  
    #   end
    #   info
# <div class="social-icon-container">
#           <a href="https://twitter.com/jmburges"><img class="social-icon" src="../assets/img/twitter-icon.png"></a>
#           <a href="https://www.linkedin.com/in/jmburges"><img class="social-icon" src="../assets/img/linkedin-icon.png"></a>
#           <a href="https://github.com/jmburges"><img class="social-icon" src="../assets/img/github-icon.png"></a>
#           <a href="http://joemburgess.com/"><img class="social-icon" src="../assets/img/rss-icon.png"></a>
#         </div>

  # -:blog => "http://joemburgess.com/",
  #     -:github => "https://github.com/jmburges",
  #     -:linkedin => "https://www.linkedin.com/in/jmburges",
  #     -:profile_quote => "\"Reduce to a previously solved problem\"",
  #     -:twitter => "https://twitter.com/jmburges",
  #     +:name => "Joe Burgess",

# {:name=>"Joe Burgess"} to match {:twitter=>"https://twitter.com/jmburges",
# :linkedin=>"https://www.linkedin.com/in/jmburges", 
# :github=>"https://github.com/jmburges", 
# :blog=>"http://joemburgess.com/", 
# :profile_quote=>"\"Reduce to a previously solved problem\"", 
# :bio=>"I grew up outside of the WashingtonDC (NoVA!) and went to college at Carnegie Mellon University in Pittsburgh. After college, I worked as an Oracle consultant for IBM for a bit and now I teach here at The Flatiron School."}