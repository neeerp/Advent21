defmodule DAY3Test do
  use ExUnit.Case

  @sample_input [
    [0, 0, 1, 0, 0],
    [1, 1, 1, 1, 0],
    [1, 0, 1, 1, 0],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 0, 1, 1, 1],
    [1, 1, 1, 0, 0],
    [1, 0, 0, 0, 0],
    [1, 1, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 1, 0, 1, 0]
  ]

  test "P1: One digit is always zero" do
    assert DAY3.part1([[1]]) == 0
    assert DAY3.part1([[0]]) == 0
  end

  test "P1: Two digits, non-zero" do
    input = [
      [1, 0],
      [1, 1],
      [1, 0]
    ] # (10, 01) i.e. (2, 1)

    assert DAY3.part1(input) == 2
  end

  test "P1: Two digits, zero" do
    input = [
      [1, 1],
      [1, 1],
      [1, 1]
    ] # (11, 00) i.e. (3, 0)

    assert DAY3.part1(input) == 0
  end

  test "P1: Sample Input" do
    input = @sample_input
    assert DAY3.part1(input) == 198
  end
end
