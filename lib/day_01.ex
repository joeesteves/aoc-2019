defmodule Day01 do
  def start do
    Helper.load_data("data/day_01_A.txt")
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate_module_fuel/1)
    |> Enum.sum
  end

  def calculate_module_fuel(mass) do
    Float.floor(mass/3) - 2
  end
end
