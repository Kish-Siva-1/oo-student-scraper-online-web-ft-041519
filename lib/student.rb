class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name] if student_hash[:name] 
    @location = student_hash[:location] if student_hash[:location]
    @@all << self
  end

  def self.create_from_collection(students_array)
    @@all[0] << students_array
    @@all.first
    binding.pry
  end

  def add_student_attributes(attributes_hash)
    
  end

  def self.all
    
  end
end

