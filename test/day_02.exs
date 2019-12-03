defmodule Day02Test do
  use ExUnit.Case
  doctest Aoc
  import Day02

  test "start" do
    assert process_data([1,0,0,0,99]) == 2
    assert process_data([2,4,4,5,99,0]) == 2
    assert process_data([2,4,4,5,99,0]) == 2
    assert process_data([1,1,1,4,99,5,6,0,99]) == 30
  end
end
