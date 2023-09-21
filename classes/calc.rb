# frozen_string_literal: true

require "rspec"
require "pry-byebug"

# Creating a Calculator class
class Calculator
  attr_accessor :result

  def evaluate(expression)
    tokens = expression.split(" ")
    first_operand = tokens.first.to_i
    second_operand = tokens.last.to_i
    operator = tokens[1] # This is going to have to be refactored.

    # binding.pry

    case operator # I don't think this is doing anything different than the if statement, but I like it better
    when "+"
      @result = first_operand + second_operand
    when "-"
      @result = first_operand - second_operand
    when "*"
      @result = first_operand * second_operand
    when "/"

      begin
        @result = first_operand / second_operand
      rescue ZeroDivisionError
        @result = "You can't divide by 0!"
      end

      if first_operand < second_operand
        @result = "In division, if the second operand is larger, the answer will always be 0!"
      elsif first_operand == second_operand
        @result = "In division, if the two operands are the same, the answer will always be 1!"
      end

    end
    @result
  end

end

c = Calculator.new
# p c.evaluate("2 + 3") # 5
# p c.evaluate("2 - 3") # -1
# p c.evaluate("2 * 3") # 6
p c.evaluate("12 / 0") # ZeroDivisionError
p c.evaluate("2 / 12") # Always 0
p c.evaluate("15 / 15") # Always 1
# p c.evaluate("2 + 3 - 4") # 1

# Using RSpec TDD make this calculator work with more than one operation at a time ie "2 + 3 - 4" should return 1.
# Create assertion about evaluation and execution
