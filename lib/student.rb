class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name] if student_hash[:name] 
    @location = student_hash[:location] if student_hash[:location]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |x|
      self.new(x)
    end
  end

  def add_student_attributes(attributes_hash)
    @bio = attributes_hash[:bio] if attributes_hash[:bio]
    @blog = attributes_hash[:blog] if attributes_hash[:blog]  
    @linkedin = attributes_hash[:linkedin] if attributes_hash[:linkedin]
    @profile_quote = attributes_hash[:profile_quote] if attributes_hash[:profile_quote]
    @twitter = attributes_hash[:twitter] if attributes_hash[:twitter]
  end

  def self.all
    @@all
  end

end

