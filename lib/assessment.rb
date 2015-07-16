require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed, and age.
# Make all of those attributes read-only.
class Dog
  def initialize(name,breed,age)
    attr_reader :name
    attr_reader :breed
    attr_reader :age
  end
end

# Question 2
# Create a new Dog object.

Answer.dog = Dog.new("fido", "lab", 3)

# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be writeable, but age should be read-only.
class Person
  def initialize(name,age,location)
    #accessor allows for read and write, is there a write only? What is it?
    attr_accessor :name
    attr_accessor :location
    attr_reader :age
  end
end

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

Answer.dave = Person.new("Dave", 32, "Ohio")
Answer.dave.location = "Somerville"

# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

class Developer < Person
  def hire_for_job
    puts "Hired."
  end
end
