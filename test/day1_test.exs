defmodule DAY1Test do
  use ExUnit.Case
  doctest DAY1

  @sample_input [
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

  ######################################################
  # Part 2
  ######################################################
  test "P2: Empty Input" do
    input = []
    assert DAY1.part2(input) == 0
  end

  test "P2: Singleton Input" do
    input = [1]
    assert DAY1.part2(input) == 0
  end

  test "P2: Two element Input" do
    input = [1,2]
    assert DAY1.part2(input) == 0
  end

  test "P2: Three element Input" do
    input = [1,2,3]
    assert DAY1.part2(input) == 0
  end

  test "P2: Strictly increasing" do
    input = [1,2,3,4,5]
    assert DAY1.part2(input) == 2
  end

  test "P2: Strictly Decreasing" do
    input = [5,4,3,2,1]
    assert DAY1.part2(input) == 0
  end

  test "P2: Sample Input" do
    assert DAY1.part2(@sample_input) == 5
  end

  ######################################################
  # Part 1
  ######################################################
  test "P1: Empty Input" do
    input = []
    assert DAY1.part1(input) == 0
  end

  test "P1: Singleton Input" do
    input = [1]
    assert DAY1.part1(input) == 0
  end

  test "P1: Strictly decreasing" do
    input = [3, 2, 1]
    assert DAY1.part1(input) == 0
  end

  test "P1: Strictly increasing" do
    input = [1, 2, 3]
    assert DAY1.part1(input) == 2
  end

  test "P1: Sample Input" do
    assert DAY1.part1(@sample_input) == 7
  end
end
