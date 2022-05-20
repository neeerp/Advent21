defmodule DAY1 do
  @moduledoc """
  The first order of business is to figure out how quickly the depth increases,
  just so you know what you're dealing with - you never know if the keys will
  get carried into deeper water by an ocean current or a fish or something.
  """

  @doc """
  Given a sequence of measurements, count the number of times a measurement
  increases from the previous measurement.

  ## Examples

      iex> DAY1.count_increasing([1, 2, 3])
      2
      iex> DAY1.count_increasing([3, 2, 1])
      0
  """
  def count_increasing(list) do
    reduce(list, 0)
  end

  def reduce([head | tail], {prev, acc}) do
    if head > prev do
      reduce(tail, {head, acc + 1})
    else
      reduce(tail, {head, acc})
    end
  end

  def reduce([head | tail], acc) do
    reduce(tail, {head, acc})
  end

  def reduce([], {_, acc}) do
    acc
  end

  def reduce([], acc) do
    acc
  end

  def run_day1(input_file) do
    {:ok, body} = File.read(input_file)
    input = Enum.map(String.split(body), fn x -> String.to_integer(x) end)
    result = count_increasing(input)
    IO.puts(result)

    result
  end
end
