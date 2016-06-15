require 'ostruct'
Answer = OpenStruct.new

# STORE YOUR ANSWER.BLAH = Answer_here
# BE SURE TO FOLLOW THE ABOVE INSTRUCTION
# BE SURE TO FOLLOW THE ABOVE INSTRUCTION
# BE SURE TO FOLLOW THE ABOVE INSTRUCTION

# Question 1
# Create a Person class, with attributes name, age, and location.
# All three attributes should be defined when you instantiate a new Person.
# Name should be readable and writeable, age should only be readable,
# and location should only be writable.

##
# your code here
##

# class Person
class Person
  attr_accessor :name
  attr_reader :age
  attr_writer :location

  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end
end

# Question 2
# Instatiate a new Person object using arguments "Dave", 32, and "Ohio".
# Then, in next line, change this Person's location property to "Somerville".
# Finally, assign the modified Person to `Answer.dave` below.

##
# your answers here
my_dave = Person.new('Dave', 32, 'Ohio')
my_dave.location = 'Somerville'
Answer.dave = my_dave
#

# Question 3
# Create another class called Developer that inherits from Person.
# Give it a new instance method called 'solve_problems',
# which returns the string "think think think".

##
# your code here
##

# class Developer
class Developer < Person
  def solve_problems
    'think think think'
  end
end

##
# Question 4
# Given code below, what be the output from calling `HouseCat.new.say_hello`?
# Store your answer in `Answer.houseCatNoise`.
#
# Then, in a comment on the next line, explain why this would be the output,
# based on the method lookup chain.

# class Animal
class Animal
  def initialize
    @sound = nil
  end

  def say_hello
    puts "I am a #{self.class.name}, and I go '#{@sound}'"
  end
end

# class Cat
class Cat < Animal
  def groom
    puts 'lick... lick...'
  end
end

# class HouseCat
class HouseCat < Cat
  def initialize
    @sound = 'meow'
  end
end

##
# your answers here
Answer.housecat_noise = "I am a HouseCat, and I go 'meow'"
# `HouseCat.new.say_hello` instantiates a new HouseCat, and then calls say_hello
# on that object. Since HouseCat doesn't have a say_hello method, Ruby will
# check Cat, and then since Cat doesn't have say_hello, it will check Animal.
# It will find the say_hello method on Animal and run that. self in Ruby stays
# as the current class so it is HouseCat. @sound for HouseCat is meow.
##

# Question 5
# Define a new class, 'Lion', which (a) inherits from 'Cat',
# (b) uses the 'Carnivorous' module below as a mixin, and
# (c) adds a new method called `roar`, which prints out "ROAR!"

# module Carnivorous
module Carnivorous
  def can_eat_meat?
    true
  end

  def eat_meat(food)
    if food.class == 'Animal'
      puts "NOM NOM NOM. #{food.class} is delicious"
    else
      puts 'Yuck!'
    end
  end
end

##
# your code here
##

# class Lion
class Lion
  include Carnivorous

  def roar
    p 'ROAR!'
  end
end

# Question 6
# What are some of the advantages of using composition (i.e. mixins)
# over using direct inheritance?
# Write your answer as a comment in the section below.

##
# your answer, in comments, here
# You can only inherit from one class. You can have many mixins.
#
##

# Question 7
# Fix the 'ComboAttack' class below so that calling
# `ComboAttack.new.punch.move('left').kick.damage` doesn't cause an error.
#
# Then, create a new class method called "get_possible_moves",
# which returns the string "kick, move, punch"

# class ComboAttack
class ComboAttack
  attr_reader :moves, :damage

  def initialize
    @moves = []
    @damage = 0
  end

  def punch
    @moves << 'punch'
    @damage += 5
    @damage *= multiplier
    self
  end

  def move(direction)
    @moves << "move #{direction}"
    self
  end

  def kick
    @moves << 'kick'
    @damage += 10
    @damage *= multiplier
    self
  end

  def self.get_possible_moves
    'kick, move, punch'
  end

  private

  def multiplier
    case moves
    when ['punch', 'move left', 'kick']
      1.5
    when %w(kick punch up)
      2
    else
      1
    end
  end
end
