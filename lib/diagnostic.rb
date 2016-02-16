require 'ostruct'
Answer = OpenStruct.new

# Question 1
# Create a Person class, with attributes name, age, and location.
# All three attributes should be defined when you instantiate a new Person.
# Name should be readable and writeable, age should only be readable,
# and location should only be writable.

class Person
  attr_reader :age
  attr_writer :location
  attr_accessor :name

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

Answer.dave = dave
#

# Question 3
# Create another class called Developer that inherits from Person.
# Give it a new instance method called 'solve_problems',
# which returns the string "think think think".

class Developer < Person
  def solve_problems
    'think think think'
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
    puts 'lick... lick...'
  end
end

class HouseCat < Cat
  def initialize
    @sound = 'meow'
  end
end

##
# your answers here
Answer.housecat_noise = "I am a Housecat, and I go 'meow'"
# HouseCat.new initializes a new Housecat object with the @sound of 'meow'.
# When we call say_hello, first the Cat class is checked for a say_hello method; it doesn't have one,
# Animal is checked. Animal has the method, so it is called, with self referring to the object type
# that called the method, "HouseCat", and @sound referring to the calling objects @sound property.

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
    puts "ROAR"
  end

end

##

# Question 6
# What are some of the advantages of using composition (i.e. mixins)
# over using direct inheritance?
# Write your answer as a comment in the section below.

##
# One can include as many mixins as one likes in a class, while a class may only inherit directly from one superclass
#
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
