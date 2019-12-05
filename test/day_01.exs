defmodule Day01Test do
  use ExUnit.Case
  doctest Aoc
  import Day01

  test "calculate_fuel/1" do
    assert calculate_fuel(12) == 2
    assert calculate_fuel(14) == 2
    assert calculate_fuel(1969) == 654
    assert calculate_fuel(100756) == 33583
  end

  test "calculate_fuel/2" do
    assert calculate_fuel(14, 0) == 2
    assert calculate_fuel(1969, 0) == 966
    assert calculate_fuel(100756, 0) == 50346
  end
end
