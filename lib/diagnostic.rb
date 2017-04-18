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
class Person
  attr_reader :name, :age
  attr_writer :name, :location

  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end
end
##

##
# Instatiate a new Person object using arguments "Dave", 32, and "Ohio".
# Then, in the next line, change this Person's location property to
# "Somerville". Finally, assign the modified Person to `Response.dave` below.

## replace nil with your response, then continue your work on the next line
dave = Person.new('Dave', 32, 'Ohio')
dave.location = 'Somerville'
Response.dave = dave
##

##
# Create another class called Developer that inherits from Person.
# Give it a new instance method called 'solve_problems',
# which returns the string "think think think".

##
class Developer < Person
  def solve_problems
    'think think think'
  end
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
Response.housecat_noise = "I am a HouseCat, and I go 'meow'"

## Explain why this would be the output, based on the method lookup chain.
# your response as a comment here
##
HouseCat.new creates a new instance of HouseCat and initializes the @sound
variable to the string 'meow'.  It then tries to find the 'say_hello' instance
method and it doesn't find it in the HouseCat class.  The HouseCat class
inherits from the Cat class and it doesn't find the 'say_hello' instance method
in that Cat class either.  The Cat class inherits from the Animal class and it
DOES find the 'say_hello' instance method there.  The 'say_hello' instance method
is executed on the HouseCat instance printing out the above output replacing
@sound with 'meow'.

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
class Lion < Cat
  include Carnivorous
  def roar
    puts "ROAR!"
  end
end
##

# #
# What are some of the advantages of using composition (i.e. mixins)
# over using direct inheritance?

##
The advantage of using a mixin over single inheritance is that you can write
code for the functionality one time (in a module), and then use the same
functionality in multiple different classes.  A class can include multiple
mixin modules but a class can only include one class through direct inheritance.

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
    when `%w`['punch', 'move left', 'kick']
      1.5
    when `%w`['kick', 'punch', 'up']
      2
    else
      1
    end
  end
end
