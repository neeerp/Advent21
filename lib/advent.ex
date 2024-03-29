defmodule Advent do
  def main(args) do
    args |> parse_args |> process
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [day: :integer]
    )
    options
  end

  defp process(options) do
    case options[:day] do
      1 -> DAY1.run_day1()
      2 -> DAY2.run_day2()
      3 -> DAY3.run_day3()
      _ -> IO.puts("Invalid selection!")
    end
  end
end
