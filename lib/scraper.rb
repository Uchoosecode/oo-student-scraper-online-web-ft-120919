require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    ix_url = open(index_url)
    scrape_url = Nokogiri::HTML(ix_url)
    card_scrape = scrape_url.css(".student-card").each_with_index do |student, i| student.text.strip end
    # binding.pry
  end

  def self.scrape_profile_page(profile_url)
    

  end

end


# self.send("#{student}=", v} if self.respond_to?("#{key}="   
    # # index_url.each_with_index {|url, i| url}
    # puts scrape_url
 
 
 
    # card_scrape = scrape_url.css(".student-card").text 
    # students = card_scrape.each do |student, v| self.send("#{student}=", v) if self.respond_to?("#{student}=")  end
    # student_card = []
    # student_card << students
    # p student_card.first