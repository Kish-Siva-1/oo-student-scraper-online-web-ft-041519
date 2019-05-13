require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped_students = []

    doc = Nokogiri::HTML(open(index_url))
      doc.css(".student-card a").each do |student_card|
        st_name = student_card.css(".student-name").text
        st_location = student_card.css(".student-location").text
        st_profile_url = "#{student_card.attr('href')}"
        scraped_students << {name: st_name, location: st_location, profile_url: st_profile_url}
      end

  scraped_students

  end

  #describe "#scrape_profile_page" do
  #  it "is a class method that scrapes a student's profile page and returns a hash of attributes describing an individual #student" do
  #    profile_url = "./fixtures/student-site/students/joe-burgess.html"
  #    scraped_student = Scraper.scrape_profile_page(profile_url)
  #    expect(scraped_student).to be_a(Hash)
  #    expect(scraped_student).to match(student_joe_hash)
  #  end

  #  it "can handle profile pages without all of the social links" do
  #    profile_url = "./fixtures/student-site/students/david-kim.html"
  #    scraped_student = Scraper.scrape_profile_page(profile_url)
  #    expect(scraped_student).to be_a(Hash)
  #    expect(scraped_student).to match(student_david_hash)
  #  end
  #end

  #let!(:student_joe_hash) {{:twitter=>"https://twitter.com/jmburges",
  #                          :linkedin=>"https://www.linkedin.com/in/jmburges",
  #                          :github=>"https://github.com/jmburges",
  #                          :blog=>"http://joemburgess.com/",
  #                          :profile_quote=>"\"Reduce to a previously solved problem\"",
  #                          :bio=>
  #"I grew up outside of the Washington DC (NoVA!) and went to college at Carnegie Mellon University in Pittsburgh. After college, I worked as an Oracle consultant for IBM for a bit and now I teach here at The Flatiron School."}}

  def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    
    tweet = nil
    linkedin = nil
    github = nil
    blog = nil
    
    profile_page.css('.social-icon-container a').each do |x| 
    binding.pry
      if x.attr('href').include?("twitter")
        tweet = x.attr('href')
        next 
      elsif x.attr('href').include?("linkedin")
        linkedin = x.attr('href')
        next
      elsif x.attr('href').include?("github")
        github = x.attr('href')
        next
      else
        blog = x.attr('href')
        next
      end 
    end 
    
    binding.pry
    prof_link = {:twitter => tweet,
     :linkedin => linkedin,
     :github => github,
     :blog => blog,
     :profile_quote => profile_page.css('.profile-quote').text,
     :bio => profile_page.css(".description-holder p").text
    }
    
    binding.pry
    prof_link
    #profile_page.css(".profile-photo a").each do |profile_link|
    #    st_profile_url = "#{profile_link.attr('href')}"
    #    profie_scrape << {name: st_name, location: st_location, profile_url: st_profile_url}
    #  end
  end

end
