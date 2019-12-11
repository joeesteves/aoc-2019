defmodule Day03Test do
  use ExUnit.Case
  import Day03

  test "string to coordinate" do
    assert string_to_coordinate("U123") == {0,123}
  end

  # test "draw" do
  #   assert draw([{0,1},{1,0}],[]) == [{0,1},{0,0},{1,1},{1,0}]
  # end

  test "process" do
    input = """
    R8,U5,L5,D3
    U7,R6,D4,L4
    """

    assert process(input) == 6
  end

  test "process 2" do
    input = """
    R75,D30,R83,U83,L12,D49,R71,U7,L72
    U62,R66,U55,R34,D71,R55,D58,R83
    """

    assert process(input) == 159
  end

  test "process 3" do
    input = """
    R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
    U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
    """

    assert process(input) == 135
  end
end
