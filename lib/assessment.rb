require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed, and age.
# Make all of those attributes read-only.

##
class Dog
  attr_reader :name, :breed, :age
  def initialize(name, breed, age)
    @name, @breed, @age = name, breed, age
  end
end
##

# Question 2
# Create a new Dog object.

# In my attempt to learn how to read/interpret a question correctly, I didn't pass in parameters the first time and received an error. Passed in parameters and the test passed. So... if you create a class and set parameters on the initialize instance method, and then invoke an new instance of that class, you must pass in arguments for the initialize instance method to run without error, yes?
Answer.dog = Dog.new("rover", "pomeranian", 26)

# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be write-only, but age should be read-only.

##
class Person
  attr_writer :name, :location
  attr_reader :age
  def initialize(name, age, location)
    @name, @age, @location = name, age, location
  end
end
##

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

Answer.dave = Person.new("Dave", 32, "Ohio")
Answer.dave.location = "Somerville"


# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

##
class Developer < Person
  def hire_for_job
  end
end
##
