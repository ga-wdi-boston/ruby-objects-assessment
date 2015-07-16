require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed, and age.
# Make all of those attributes read-only.

##
class Dog
  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
  end
attt_reader :name
attt_reader :breed
attt_reader :age
end

# Question 2
# Create a new Dog object.

Answer.dog =
Dog.new("Scooby", "Great Dane", 50)


 # replace nil with your code

# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be writeable, but age should be read-only.

##
class Person
  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end

  attr_reader :age
  attr_writer :name
  attr_writer :location
end

##

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

Answer.dave = Person.new("Dave", 32, "Ohio")

Answer.dave.location =
  Dave.location = "Somerville"
end



# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

##
class Developer < Person
  def hire_for_job
    puts "I can believe there is not a single job in this entire city!   Ya, unless you want to work 40 hours a week"
  end
  attr_accessor :hire_for_job
end
##
