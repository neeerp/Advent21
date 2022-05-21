defmodule DAY2 do
  @moduledoc """
  PART 1
  ======
  The submarine takes a series of commands like `forward 1`, `down 2`, or `up 3`:
  - `forward X` increases the horizontal position by `X` units.
  - `down X` increases the depth by `X` units.
  - `up X` decreases the depth by `X` units.

  The submarine already has a planned course; we want to figure out where we're
  going. Our starting position and depth are both `0`.

  The answer to our puzzle is the product of the position and depth.
  """

  @input_file "input/day2.input"
  def run_day2() do
    {:ok, body} = File.read(@input_file)

    cmds = parse_body(body)

    part1_result = part1(cmds)
    IO.puts("The result for part 1 is: #{part1_result}")
  end

  defp parse_body(body) do
    Enum.map(
      String.split(body, "\n", trim: true),
      fn s -> to_cmd(List.to_tuple(String.split(s))) end
    )
  end

  defp to_cmd({cmd, val}) do
    case cmd do
      "forward" -> %{forward: val}
      "down" -> %{down: val}
      "up" -> %{up: val}
    end
  end

  @doc """
  Takes a list of {command, magnitude} pairs and returns the product of
  the end position and depth.
  """
  def part1(_commands) do
    :not_implemented
  end


end
