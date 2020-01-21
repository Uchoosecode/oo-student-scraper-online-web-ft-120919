require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(index_url)
    scraped_students = []
    ix_url = open(index_url)
    scrape_url = Nokogiri::HTML(ix_url)
   
    scrape_url.css(".student-card").css.map do |students| 
      scraped_students{:name => students(".student-name").text,
       :location => students(".student-location").text,
       :profile_url => students.attr("href").value
    end
    scraped_students
      profile_url = students.css("a").attr("href").value
      student_name = students.css(".student-name").text
      student_location = students.css(".student-location").text
      scraped_students << {:name => student_name, :location => student_location, :profile_url => profile_url}
  end

  def self.scrape_profile_page(profile_url)
    scrape_index_page(profile_url)
      pf_url = open(profile_url)
      scrape_pf = Nokogiri::HTML(pf_url)
      scraped_profile = {}
      profile_name = scrape_pf.css(".profile-name").text
      
      profile_bio = scrape_pf.css(".description-holder").css("p").text
      
      deep_scraper = scrape_pf.css(".social-icon-container").css("a").collect {|icon| 
                          icon.attribute("href").value}
      
        deep_scraper.each do |info|
          if info.include?("twitter")
            scraped_profile[:twitter] = info
            
          elsif info.include?("linkedin") 
            scraped_profile[:linkedin] = info
            
          elsif info.include?("github")
            scraped_profile[:github] = info
            
          elsif info.include?(".com")
            scraped_profile[:blog] = info
            
          end
        end
        scraped_profile[:bio] = profile_bio
        scraped_profile[:profile_quote] = scrape_pf.css(".profile-quote").text
    scraped_profile
  end
end
  