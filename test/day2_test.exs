defmodule DAY2Test do
  use ExUnit.Case

  @sample_input [
    {:forward, 5},
    {:down, 5},
    {:forward, 8},
    {:up, 3},
    {:down, 8},
    {:forward, 2}
  ]

  test "P1: Empty Input" do
    input = []
    assert DAY2.part1(input) == 0
  end

  test "P1: Only Forward" do
    input = [{:forward, 42}]
    assert DAY2.part1(input) == 0
  end

  test "P1: Only Up and Down" do
    input = [{:up, 42}, {:down, 41}]
    assert DAY2.part1(input) == 0
  end

  test "P1: Forward 1 with depth" do
    input = [{:forward, 1}, {:down, 42}]
    assert DAY2.part1(input) == 42
  end

  test "P1: Down with movement" do
    input = [{:down, 2}, {:forward, 21}]
    assert DAY2.part1(input) == 42
  end

  test "P1: Fish out of water" do
    input = [{:up, 3}, {:forward, 2}]
    assert DAY2.part1(input) == -6
  end

  test "P1: Sample Input" do
    input = @sample_input
    assert DAY2.part1(input) == 150
  end
end
