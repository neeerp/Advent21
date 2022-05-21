defmodule DAY3 do
  @moduledoc """
  PART 1
  ======
  The submarine is making weird noises, so you ask it to produce a diagnostic
  report. The report consists of a list of binary numbers...

  Using the report, we need to generate two new binary numbers, the gamma rate
  and epsilon rate. The power consumption is the product of the two.

  Each bit in the gamma rate can be determined by finding the most common bit in
  the corresponding position of all numbers in the diagnostic report. The
  epsilon rate, in turn, is the compliment.
  """

  @input_file "input/day3.input"
  def run_day3() do
    {:ok, body} = File.read(@input_file)
    bit_lists = parse_body(body)

    part1_result = part1(bit_lists)
    IO.puts("The result for part 1 is: #{part1_result}")
  end

  def parse_body(body) do
    Enum.map(String.split(body, "\n", trim: true), &to_bits/1)
  end

  def to_bits(binchar_str) do
    Enum.reduce(String.codepoints(binchar_str), <<>>, fn chr, bits -> 
      if chr == "1" do 
        bits <> <<1>> 
      else 
        bits <> <<0>> 
      end 
    end)
  end

  def part1(_bit_lists) do
    :not_implemented
  end
end
