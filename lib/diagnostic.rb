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

class Person
  attr_reader :age
  attr_accessor :name
  attr_writer :location

  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end
end

# Question 2
# Instatiate a new Person object using arguments "Dave", 32, and "Ohio".
# Then, in the next line, change this Person's location property to "Somerville".
# Finally, assign the modified Person to `Answer.dave` below.

##
dave = Person.new('Dave', 32, 'Ohio')
dave.location = 'Somerville'
Answer.dave = ['Dave', 32, 'Somerville']
#

# Question 3
# Create another class called Developer that inherits from Person.
# Give it a new instance method called 'solve_problems',
# which returns the string "think think think".

class Developer < Person
  def solve_problems
    puts "think think think"
  end
end

##
# Question 4
# Given the code below, what be the output from calling `HouseCat.new.say_hello`?
# Store your answer in `Answer.houseCatNoise`.
#
# Then, in a comment on the next line, explain why this would be the output,
# based on the method lookup chain.

class Animal
  def initialize
      @sound = nil
  end

  def say_hello
      puts "I am a #{self.class.name}, and I go '#{@sound}'"
  end
end

class Cat < Animal
  def groom
    puts "lick... lick..."
  end
end

class HouseCat < Cat
  def initialize
    @sound = "meow"
  end
end

##
# your answers here
Answer.housecat_noise = "I am a HouseCat, and I go 'meow'"
# This would be the answer because the look up chain would set sound as "meow"
# and then go from HouseCat to Cat to Animal looking for the method say_hello.
#Once say_hello is found inside animal, the #{self} refers to the original object
#so HouseCat and sound is already set in HouseCat as 'meow'.
##

# Question 5
# Define a new class, 'Lion', which (a) inherits from 'Cat',
# (b) uses the 'Carnivorous' module below as a mixin, and
# (c) adds a new method called `roar`, which prints out "ROAR!"

module Carnivorous
  def can_eat_meat?
    true
  end

  def eat_meat(food)
    if food.class == "Animal"
      puts "NOM NOM NOM. #{food.class} is delicious"
    else
      puts "Yuck!"
    end
  end
end

##
class Lion < Cat
  include Carnivorous
  def roar
    puts "ROAR!"
  end
end
##

# Question 6
# What are some of the advantages of using composition (i.e. mixins)
# over using direct inheritance?
# Write your answer as a comment in the section below.

##
# Mixins are good because multiple classes that do not necessarily inherit
# from each other can all use the same mixins. Also, overwriting should only
# really happen when necessary so it's useful to have mixins that allow a method
# to be called independently of inheritance so that a class that is inheriting
# from other classes can directly access a method rather than rewrite anything
# in certain instances.
##

# Question 7
# Fix the 'ComboAttack' class below so that calling
# `ComboAttack.new.punch.move('left').kick.damage` doesn't cause an error.
#
# Then, create a new class method called "get_possible_moves",
# which returns the string "kick, move, punch"

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
  end

  def move(direction)
    @moves << "move #{direction}"
  end

  def kick
    @moves << 'kick'
    @damage += 10
    @damage *= multiplier
  end

  def get_possible_moves
    puts 'kick, move, punch'
  end

  private
  def multiplier
    case (moves)
    when ['punch', 'move left', 'kick']
      1.5
    when ['kick', 'punch', 'up']
      2
    else
      1
    end
  end
end

#Not really sure how to solve this except the issue is with the "move"
#method....looks like its somehow being called on damage but not enough
#time to complete this. Did the last part of the question though. 
