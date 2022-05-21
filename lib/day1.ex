defmodule DAY1 do
  @moduledoc """
  The first order of business is to figure out how quickly the depth increases,
  just so you know what you're dealing with - you never know if the keys will
  get carried into deeper water by an ocean current or a fish or something.
  """

  @input_file "input/day1.input"

  def run_day1() do
    {:ok, body} = File.read(@input_file)
    input = Enum.map(String.split(body), fn x -> String.to_integer(x) end)

    part1_result = part1(input)
    IO.puts("The result for part 1 is: #{part1_result}")

    part2_result = part2(input)
    IO.puts("The result for part 2 is: #{part2_result}")
  end

  @doc """
  Given a sequence of measurements, consider the sums of 'three-measurement'
  sliding window. Count the number of times a window sum increases relative to
  the previous sum.
  """
  def part2(list) do
    part1(p2_map(list))
  end

  defp p2_map([h1 | tail = [h2 | [h3 | _]]]) do
    [h1 + h2 + h3 | p2_map(tail)]
  end

  defp p2_map(_) do
    []
  end

  @doc """
  Given a sequence of measurements, count the number of times a measurement
  increases from the previous measurement.
  """
  def part1(list) do
    p1_helper(list)
  end

  defp p1_helper(list) do
    case list do
      [head | tail] -> p1_reduce(tail, {head, 0})
      _ -> 0
    end
  end

  defp p1_reduce([head | tail], {prev, acc}) do
    if head > prev do
      p1_reduce(tail, {head, acc + 1})
    else
      p1_reduce(tail, {head, acc})
    end
  end

  defp p1_reduce([], {_, acc}) do
    acc
  end
end
