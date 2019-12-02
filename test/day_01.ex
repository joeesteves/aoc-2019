defmodule Day01Test do
  use ExUnit.Case
  doctest Aoc
  import Day01

  test "calculate_module_fuel" do
    assert calculate_module_fuel(12) == 2
    assert calculate_module_fuel(14) == 2
    assert calculate_module_fuel(1969) == 654
    assert calculate_module_fuel(100756) == 33583
  end
end
