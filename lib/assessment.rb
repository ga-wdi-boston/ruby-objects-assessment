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
# Comfort: 5
# Clarity: 5

# Question 2
# Create a new Dog object.

spud = Dog.new

# Comfort: 4
# Clarity: 4

# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be write-only, but age should be read-only.

class Person
  attr_reader :age
  attr_writer :name, :location

  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end
 end
# Comfort: 5
# Clarity: 4

# I looked up how to write only
# http://stackoverflow.com/questions/5046831/why-use-rubys-attr-accessor-attr-reader-and-attr-writer

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

dave = Person.new 'Dave', '32', 'Ohio'
dave.location = 'Somerville'

# Comfort:
# Clarity: 4
# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

class Developer < Person
  attr_accessor :hire_for_job

  def hire_for_job
    @hire_for_job = hire_for_job
  end
end
# Comfort: 4
# Clarity: 4
