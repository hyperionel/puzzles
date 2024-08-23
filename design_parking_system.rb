# Design a parking system for a parking lot. The parking lot has three kinds of parking spaces: big, medium, and small, with a fixed number of slots for each size.

# Implement the ParkingSystem class:

# ParkingSystem(int big, int medium, int small) Initializes object of the ParkingSystem class. 
# The number of slots for each parking space are given as part of the constructor.
# bool addCar(int carType) Checks whether there is a parking space of carType for the car that wants to get into the parking lot.
# carType can be of three kinds: big, medium, or small, which are represented by 1, 2, and 3 respectively. 
# A car can only park in a parking space of its carType. If there is no space available, return false, else park the car in that size space and return true.

# O(1) time | O(1) space
# Sol 1
class ParkingSystem
  attr_accessor :big, :medium, :small
  
  def initialize(big, medium, small)
    @big = big
    @medium = medium
    @small = small
  end

  def add_car(car_type)
    if car_type == 1
      if @big > 0
        @big -= 1
        return true
      end
      return false
    elsif car_type == 2
      if @medium > 0
        @medium -= 1
        return true
      end
      return false
    elsif car_type == 3
      if @small > 0
        @small -= 1
        return true
      end
      return false
    else
      return false
    end
  end
end

# Sol 2
class ParkingSystem
  attr_accessor :big, :medium, :small

  def initialize(big, medium, small)
    @big = big
    @medium = medium
    @small = small
    @types = [0, @big, @medium, @small]
  end

  def add_car(car_type)
    @types[car_type] -= 1
    !@types[car_type].negative?
  end
end