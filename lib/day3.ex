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
    Enum.map(String.split(body, "\n", trim: true), fn chrlist ->
      Enum.map(String.codepoints(chrlist), &String.to_integer/1) end)
  end

  # def to_bits(binchar_str) do
  #   Enum.reduce(String.codepoints(binchar_str), <<>>, fn chr, bits -> 
  #     if chr == "1" do 
  #       bits <> <<1>> 
  #     else 
  #       bits <> <<0>> 
  #     end 
  #   end)
  # end

  def part1(bit_lists) do
    sums = Enum.reduce(tl(bit_lists), hd(bit_lists), &p1_reduce/2)
    gma = get_gamma(length(bit_lists), sums)
    eps = compliment(gma)

    Integer.undigits(gma, 2) * Integer.undigits(eps, 2)
  end

  defp p1_reduce(cur, acc) do Enum.map(Enum.zip(cur, acc), fn {x, y} -> x + y end) end
  defp get_gamma(n, sums) do Enum.map(sums, &(if &1 > n/2 do 1 else 0 end)) end
  defp compliment(list) do Enum.map(list, &(1 - &1)) end
end
