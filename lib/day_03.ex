defmodule Day03 do
  def start do
    Helper.load_data("data/day_03.txt")
    |> String.trim
    |> String.split
    |> Enum.map(fn wire ->
      String.split(wire, ",")
      |> Enum.map(&string_to_coordinate/1)
      |> draw
    end)

  end

  defp draw([a, b | rest], draw \\ []¨) do

  end

  defp string_to_coordinate(<<direction>> <> distance) do
    distance = String.to_integer(distance)

    case direction do
      ?U -> {0, distance}
      ?R -> {distance, 0}
      ?D -> {0, -distance}
      ?L -> {-distance, 0}
    end
  end
end
