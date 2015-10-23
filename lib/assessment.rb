require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed, and age.
# Make all of those attributes read-only.

##
class Dog
  attr_reader :name, :breed, :age

  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
  end

end

##

# Question 2
# Create a new Dog object.

Answer.dog = Dog.new ("Rowlf", "Cocker Spaniel", 60)

#with out the Answer.dog portion the LHS would be just the word rowlf


# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be writeable, but age should be read-only.

##
class Person
  attr_reader :age
  attr_writer :name, :location

  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end

end
##################################################################
#if something is writeable only do I have to put it in initialize#
#or is just putting it in the attr_writer okay?                  #
##################################################################

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
    #my code goes here#
  end
end

##
