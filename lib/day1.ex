defmodule DAY1 do
  @moduledoc """
  The first order of business is to figure out how quickly the depth increases,
  just so you know what you're dealing with - you never know if the keys will
  get carried into deeper water by an ocean current or a fish or something.
  """

  @doc """
  Given a sequence of measurements, consider the sums of 'three-measurement'
  sliding window. Count the number of times a window sum increases relative to
  the previous sum.
  """
  def part2(list) do
    part1(p2_map(list))
  end

  def p2_map([h1 | tail = [h2 | [h3 | _]]]) do
    [h1 + h2 + h3 | p2_map(tail)]
  end

  def p2_map(_) do
    []
  end

  @doc """
  Given a sequence of measurements, count the number of times a measurement
  increases from the previous measurement.

  ## Examples

      iex> DAY1.part1([1, 2, 3])
      2
      iex> DAY1.part1([3, 2, 1])
      0
  """
  def part1(list) do
    p1_reduce(list, 0)
  end

  def p1_reduce([head | tail], {prev, acc}) do
    if head > prev do
      p1_reduce(tail, {head, acc + 1})
    else
      p1_reduce(tail, {head, acc})
    end
  end

  def p1_reduce([head | tail], acc) do
    p1_reduce(tail, {head, acc})
  end

  def p1_reduce([], {_, acc}) do
    acc
  end

  def p1_reduce([], acc) do
    acc
  end

  def run_part1(input_file) do
    {:ok, body} = File.read(input_file)
    input = Enum.map(String.split(body), fn x -> String.to_integer(x) end)
    result = part1(input)
    IO.puts(result)

    result
  end

  def run_part2(input_file) do
    {:ok, body} = File.read(input_file)
    input = Enum.map(String.split(body), fn x -> String.to_integer(x) end)
    result = part2(input)
    IO.puts(result)

    result
  end
end
