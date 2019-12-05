defmodule Day01 do
  def start do
    Helper.load_data("data/day_01_A.txt")
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate_fuel/1)
    |> Enum.sum
  end

  def calculate_fuel(0, acc), do: acc

  def calculate_fuel(mass, acc) do
    fuel = calculate_fuel(mass)
    calculate_fuel(fuel, acc + fuel)
  end


  def calculate_fuel(mass) when mass > 0 do
    case Float.floor(mass/3) - 2 do
      x when x > 0 -> x
      _ -> 0
    end
  end

  def calculate_fuel(mass), do: 0
end
