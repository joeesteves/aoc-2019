defmodule Helper do
  def load_data(path) do
    File.read!(path)
  end
end
