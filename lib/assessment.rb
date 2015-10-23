require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed, and age.
# Make all of those attributes read-only.

class Dog
  attr_reader :name
  attr_reader :breed
  attr_reader :age

# This is in case I am supposed to set the attributes
def initialize(name, breed, age)
  @name = name
  @breed = breed
  @age = age
end
end
##

# Question 2
# Create a new Dog object.

Answer.dog = pooch = Dog.new("Pooch", "poodle", 3)


# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be write-only, but age should be read-only.

##
class Person
  attr_writer :name
  attr_reader :age
  attr_writer :location


  def initialize(name, age, location)

    @name = name
    @age = age
    @location = location
  end
end
##

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

Answer.dave = dave = Person.new("Dave", 32, "Ohio") # replace nil with your code
Answer.dave.location = dave.location.new = dave.location.gsub(/Ohio/, 'Somerville') # replace nil with your code

# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

##
# Should I assume that class Person already exists?  If not

class Person
  attr_reader :something
def something
end

class Developer < Person
  def hire_for_job
  end
##


