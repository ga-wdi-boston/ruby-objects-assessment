require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a class called Dog. It should have, as attributes, name, breed,
# and age. Make all of those attributes read-only.

# stupid rubocop error message, also, is trailing white space
# THAT big a deal?
class Dog
  attr_reader :name
  attr_reader :age
  attr_reader :breed

  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
  end
end

# Question 2
# Create a new Dog object.

Answer.dog = Dog.new('Rupert', 'Goldendoodle', 2)

# Question 3
# Create a Person class, with attributes name, age, and location.
# It should set all three attributes when you create a new Person.
# Name and location should be write-only, but age should be read-only.

# just want to get rid of that class error from rubocop
class Person
  attr_writer :name
  attr_writer :location
  attr_reader :age

  def initialize(name, location, age)
    @name = name
    @location = location
    @age = age
  end
end

# Question 4
# Create a new Person object using parameters "Dave", 32, and "Ohio".
# Then, set that Person's location to "Somerville"

Answer.dave = Person.new('Dave', 32, 'Ohio') # replace nil with your code
Answer.dave.location = 'Somerville' # replace nil with your code

# Question 5
# Create another class called Developer that inherits from Person.
# Give it a new public method called 'hire_for_job'

# What should I put in these messages anyway?
class Developer < Person
  def hire_for_job
    puts 'You know you want to hire me'
  end
end
