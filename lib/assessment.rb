require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed, and age.
# Make all of those attributes read-only.

##
class Dog
  attr_reader :name
  attr_reader :breed
  attr_reader :age

  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
  end
end


##

# Question 2
# Create a new Dog object.

Answer.dog = Dog.new("Sparky", "pug", 3) # replace nil with your code


# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be writeable, but age should be read-only.

##
class Person
  attr_writer :name
  attr_writer :location
  attr_reader :age

  #this is equivalent to attr_reader above
  # def age
  #   @age
  # end

  def initialize(name, location, age)
    @name = name
    @location = location
    @age = age
  end
end

##

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

Answer.dave = Person.new("Dave", "Ohio", 32) # Age can't be set as it's read-only
Answer.dave.location = "Somerville" # replace nil with your code

# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

##
class Developer < Person
  attr_accessor :hire_for_job
  def initialize(hire_for_job)
    @hire_for_job = hire_for_job
  end
end

##
