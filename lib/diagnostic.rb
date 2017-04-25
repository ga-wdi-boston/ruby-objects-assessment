# frozen_string_literal: true

require 'ostruct'
Response = OpenStruct.new

##
# For questions which ask for a response but do not provide a
# `Response.something =` assignment, write code that meets the requirements
# using idiomatic and conventional Ruby. Running the tests and carefully
# inspecting messages can help if you've named something incorrectly.
#
# For questions which **do** provide a `Response.something =` assignment, you
# should replace whatever is assigned with your answer. For example, if the
# answer to a question is the `true` boolean:
#
#   ```diff
#   - Response.wdi_is_awesome = nil
#   + Response.wdi_is_awesome = true
#   ```
##

##
# Create a Person class, with attributes name, age, and location. All three
# attributes should be defined when you instantiate a new Person. Name should be
# readable and writeable, age should only be readable, and location should only
# be writable.

##
# your response here
class Person
  attr_reader :age
  attr_writer :location
  attr_accessor :name
  def initialize(age, location, name)
    @age = age
    @location = location
    @name = name
  end

##

##
# Instatiate a new Person object using arguments "Dave", 32, and "Ohio".
# Then, in the next line, change this Person's location property to
# "Somerville". Finally, assign the modified Person to `Response.dave` below.

## replace nil with your response, then continue your work on the next line
dave = Person.new(32, "Ohio", "Dave")
Response.dave = dave
dave.location = "Somerville"
##

##
# Create another class called Developer that inherits from Person.
# Give it a new instance method called 'solve_problems',
# which returns the string "think think think".

##
# your response here
Class Developer < Person
def solve_problems
  yield "think think think"
end
##

##
# Study the code below before responding.

# Animal Class
class Animal
  def initialize
    @sound = nil
  end

  def say_hello
    puts "I am a #{self.class.name}, and I go '#{@sound}'"
  end
end

# Cat Class inherits from Animal
class Cat < Animal
  def groom
    puts 'lick... lick...'
  end
end

# HouseCat class inherits from Cat, then Animal
class HouseCat < Cat
  def initialize
    @sound = 'meow'
  end
end



## What will be the output from calling `HouseCat.new.say_hello`?
# replace nil with your response
Response.housecat_noise = "I am a Housecat and I go 'meow'"

## Explain why this would be the output, based on the method lookup chain.
# your response as a comment here
The class Housecat inherits from the class Cat which inherits from the class Animal.
The class Animal has a method called say_hello which is being used in the HouseCat.new.say_hello syntax.
The method say_hello has a block of code that puts "I am a #{self.class.name}, and I go '#{@sound}'"
Self is reffering to the Housecat class(although not entirely sure why),
and it is also passing in the sound instance variable which is assigned to the string 'meow'
##

##
# Define a new class, 'Lion', which (a) inherits from 'Cat',
# (b) uses the 'Carnivorous' module below as a mixin, and
# (c) adds a new method called `roar`, which prints out "ROAR!"

# Carnivorous module definition
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
# your response here
class Lion < Cat
  include Carnivorous
end
def roar
  puts "ROAR!"
end
##

# #
# What are some of the advantages of using composition (i.e. mixins)
# over using direct inheritance?
Mixins are generally used for various classes that are indirectly related to each other
so for instance we can have a module of Sleepable and have it applied to the classes
of Person and Computer. Although person and computer are not directly relatable, they are
both classes that have an ability to sleep. Direct inheritance on the other hand
works with classes that are directly related to each other.
##
# your response as a comment here
##

##
# Fix the 'ComboAttack' class below so that calling
# `ComboAttack.new.punch.move('left').kick.damage` doesn't cause an error.
#
# Then, create a new class method called "get_possible_moves",
# which returns the string "kick, move, punch"

# ComboAttack Class definition
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

  private

  def multiplier
    case moves
    when `%w`['punch', 'move left', 'kick']
      1.5
    when `%w`['kick', 'punch', 'up']
      2
    else
      1
    end
  end
end
