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

  PART 2
  ======
  There is a third value that we need to track beyond horizontal position and
  depth: `aim`, which also starts at `0`. Furthermore, the other commands are
  more complex:
  - `down X` increases aim by `X` units
  - `up X` decreases aim by `X` units
  - `forward X`
    - increases horizontal position by `X` units
    - increases depth by aim multiplied by `X` units

  The answer to our puzzle is once again the product of the position and depth.
  """

  @input_file "input/day2.input"
  def run_day2() do
    {:ok, body} = File.read(@input_file)

    cmds = parse_body(body)

    part1_result = part1(cmds)
    IO.puts("The result for part 1 is: #{part1_result}")

    part2_result = part2(cmds)
    IO.puts("The result for part 2 is: #{part2_result}")
  end

  defp parse_body(body) do
    Enum.map(
      String.split(body, "\n", trim: true),
      fn s -> to_cmd(List.to_tuple(String.split(s))) end
    )
  end

  defp to_cmd({cmd, val}) do
    val = String.to_integer(val)
    case cmd do
      "forward" -> {:forward, val}
      "down" -> {:down, val}
      "up" -> {:up, val}
    end
  end

  @doc """
  Takes a list of {command, magnitude} pairs and returns the product of
  the end position and depth, using the part 2 control scheme.
  """
  def part2(commands) do
    {pos, depth} = Enum.reduce(commands, {0, 0}, &p2_reduce/2)
    pos * depth
  end

  defp p2_reduce({cmd, val}, {pos, depth}) do
    {pos, depth}
  end

  @doc """
  Takes a list of {command, magnitude} pairs and returns the product of
  the end position and depth using the part 1 control scheme.
  """
  def part1(commands) do
    {pos, depth} = Enum.reduce(commands, {0, 0}, &p1_reduce/2)
    pos * depth
  end

  defp p1_reduce({cmd, val}, {pos, depth}) do
    case cmd do
      :forward -> {pos + val, depth}
      :down -> {pos, depth + val}
      :up -> {pos, depth - val}
    end
  end
end
