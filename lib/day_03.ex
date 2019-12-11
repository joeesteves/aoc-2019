defmodule Day03 do
  def start do
    Helper.load_data("data/day_03.txt")
    |> process
  end

  def process(input) do
    input
    |> to_wires
    |> prepare
    |> draw_wires
    |> seek_cross
  end

  def seek_cross([w1, w2]) do
    MapSet.intersection(w1, w2)
    |> MapSet.to_list()
    |> Enum.reject(fn xy -> xy == {0, 0} end)
    |> Enum.map(fn {x, y} -> abs(x) + abs(y) end)
    |> Enum.min()
  end

  def to_wires(input) do
    input
    |> String.trim()
    |> String.split()
  end

  def prepare(wires) do
    wires
    |> Enum.map(fn wire ->
      String.split(wire, ",")
      |> Enum.map(&string_to_coordinate/1)
    end)
  end

  def draw_wires(wires) do
    wires
    |> Enum.map(fn wire ->
      ([{0, 0}] ++ wire)
      |> draw([])
    end)
  end

  def draw([_last_plus], draw) do
    draw
    |> List.flatten()
    |> Enum.reverse()
    |> Enum.reduce(MapSet.new(), fn x, acc ->
      MapSet.put(acc, x)
    end)
  end

  def draw([{xa, ya}, {xb, yb} | rest], draw) do
    stroke =
      for x <- (xb + xa)..xa, y <- (yb + ya)..ya do
        {x, y}
      end

    draw([{xb + xa, yb + ya} | rest], [stroke | draw])
  end

  def string_to_coordinate(<<direction>> <> distance) do
    distance = String.to_integer(distance)

    case direction do
      ?U -> {0, distance}
      ?R -> {distance, 0}
      ?D -> {0, -distance}
      ?L -> {-distance, 0}
    end
  end
end
