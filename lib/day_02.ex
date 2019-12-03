defmodule Day02 do
  def start do
    prepare_data(12, 2)
    |> process_data
  end

  def prepare_data(noun, verb) do
    [x, _, _ | rest] =
      Helper.load_data("data/day_02.txt")
      |> String.split(~r/(,|\n)/, trim: true)
      |> Enum.map(&String.to_integer/1)

    [x, noun, verb | rest]
  end

  def get_noun_verb_for(magic_number) do
    try do
      for noun <- 0..99, verb <- 0..99 do
        case prepare_data(noun, verb)
             |> process_data do
          ^magic_number -> throw({noun, verb})
          _ -> nil
        end
      end
    catch
      x -> x
    end
  end

  def process_data(data_input) do
    data_input_with_index =
      data_input
      |> Enum.with_index()
      |> Enum.map(fn {value, idx} -> {idx, value} end)
      |> Enum.into(%{})

    process_chunk(data_input, data_input, data_input_with_index, 1)
  end

  def process_chunk([99 | _], _, data, _), do: data[0]

  def process_chunk([op, input1, input2, target | _], data_input, data, iteration) do
    result =
      case op do
        1 -> data[input1] + data[input2]
        2 -> data[input1] * data[input2]
      end

    data = %{data | target => result}

    data_input = List.update_at(data_input, target, fn _ -> result end)

    {_, rest_data} = data_input |> Enum.split(iteration * 4)

    process_chunk(rest_data, data_input, data, iteration + 1)
  end
end
