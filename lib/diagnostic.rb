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
# person class
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
# Then, in a comment on the next line,

# top line comment
class Animal
  def initialize
    @sound = nil
  end

  def say_hello
    puts "I am a #{self.class.name}, and I go '#{@sound}'"
  end
end

# top line comment
class Cat < Animal
  def groom
    puts 'lick... lick...'
  end
end

# top line comment
class HouseCat < Cat
  def initialize
    @sound = 'meow'
  end
end

## What will be the output from calling `HouseCat.new.say_hello`?
# replace nil with your response
Response.housecat_noise = "I am a House Cat, and I go 'meow'"

## Explain why this would be the output, based on the method lookup chain.
# your response as a comment here
##
# When you create a new HouseCat it inherits from Cat and from Animal. The
# say_hello method doesn't exist on HouseCat so it looks at Cat which also
# doesn't have a method by that name. It looks up and finds it on Animal. The
# string that prints has #{self.class.name} which I believe would evaluate to
# HouseCat because that is the class the method is being called on. It also has
# #{sound} which was initialized as 'meow' when we created a new instance of
# Housecat.
##

# Define a new class, 'Lion', which (a) inherits from 'Cat',
# (b) uses the 'Carnivorous' module below as a mixin, and
# (c) adds a new method called `roar`, which prints out "ROAR!"

# comment
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
# Lion clas
class Lion < Cat
  include Carnivorous

  def roar
    p 'ROAR!'
  end
end
##

# #
# What are some of the advantages of using composition (i.e. mixins)
# over using direct inheritance?

##
# Mixins allow you to describe a type of behaviour that can be shared by many
# unrelated classes. Inheritance is more strict and means that the new class
# is encapsulated by the class it inherited from. Mixins let you describe some
# behaviour and easily place it into any class you want without it having to
# be directly tied to another class.
##

##
# Fix the 'ComboAttack' class below so that calling
# `ComboAttack.new.punch.move('left').kick.damage` doesn't cause an error.
#
# Then, create a new class method called "get_possible_moves",
# which returns the string "kick, move, punch"

# comment
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
    when %w(punch 'move left' kick)
      1.5
    when %w(kick punch up)
      2
    else
      1
    end
  end
end
