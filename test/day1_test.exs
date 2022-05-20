defmodule DAY1Test do
  use ExUnit.Case
  doctest DAY1

  test "Empty Input" do
    input = []
    assert DAY1.count_increasing(input) == 0
  end

  test "Singleton Input" do
    input = [1]
    assert DAY1.count_increasing(input) == 0
  end

  test "Strictly decreasing" do
    input = [3, 2, 1]
    assert DAY1.count_increasing(input) == 0
  end

  test "Strictly increasing" do
    input = [1, 2, 3]
    assert DAY1.count_increasing(input) == 2
  end

  test "Day 1 Sample Input" do
    input = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]

    assert DAY1.count_increasing(input) == 7
  end
end
