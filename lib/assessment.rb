require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed, and age.
# Make all of those attributes read-only.

class Dog
  attr_reader :name, :breed, :age

  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
  end
end

# Question 2
# Create a new Dog object.

Answer.dog = Dog.new("Fido", "yellow lab", 5)

# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be writeable, but age should be read-only.

class Person
  attr_writer :name, :location
  attr_reader :age

  def initialize(name, age, location)
    @name, @age, @location = name, age, location
  end
end

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

Answer.dave = Person.new("Dave", 32, "Ohio")
Answer.dave.location = "Ohio"

# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

class Developer < Person

  def hire_for_job
    puts "Hire me!"
  end
end
#still working on this one!
