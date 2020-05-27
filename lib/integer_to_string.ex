defmodule IntegerToString do
  @moduledoc """
    Handles the logic to convert a integer from 0 - 9999 into it's string representation.

    Example:
      > IntegerToString.convert_to_string(8000)
      "eight thousand"
  """

  @single_ints %{
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }
  @double_ints %{
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "fourty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  def convert_to_string(integer) when integer >= 0 and integer <= 9, do: handle_single(integer)

  def convert_to_string(integer) when integer >= 10 and integer <= 99, do: handle_tens(integer)

  def convert_to_string(integer) when integer >= 100 and integer <= 999,
    do: handle_hundreds(integer)

  def convert_to_string(integer) when integer >= 1000, do: handle_thousands(integer)

  def handle_single(integer) do
    {_div, val} = get_div_rem(integer, 10)
    Map.get(@single_ints, val)
  end

  def handle_tens(integer) when (integer >= 10 and integer <= 20) or rem(integer, 10) == 0 do
    Map.get(@double_ints, integer)
  end

  def handle_tens(integer) do
    {div, val} = get_div_rem(integer, 10)
    Map.get(@double_ints, div * 10) <> "-" <> Map.get(@single_ints, val)
  end

  def handle_hundreds(integer) when rem(integer, 100) == 0 do
    {div, _val} = get_div_rem(integer, 100)
    Map.get(@single_ints, div) <> " hundred"
  end

  def handle_hundreds(integer) when rem(integer, 100) >= 10 do
    {div, val} = get_div_rem(integer, 100)
    Map.get(@single_ints, div) <> " hundred " <> handle_tens(val)
  end

  def handle_hundreds(integer) do
    {div, val} = get_div_rem(integer, 100)
    Map.get(@single_ints, div) <> " hundred " <> handle_single(val)
  end

  def handle_thousands(integer) when rem(integer, 1000) == 0 do
    {div, _val} = get_div_rem(integer, 1000)
    Map.get(@single_ints, div) <> " thousand"
  end

  def handle_thousands(integer) when rem(integer, 1000) < 10 do
    {div, val} = get_div_rem(integer, 1000)
    Map.get(@single_ints, div) <> " thousand " <> handle_single(val)
  end

  def handle_thousands(integer) when rem(integer, 1000) < 100 and rem(integer, 1000) >= 10 do
    {div, val} = get_div_rem(integer, 1000)
    Map.get(@single_ints, div) <> " thousand " <> handle_tens(val)
  end

  def handle_thousands(integer) do
    {div, val} = get_div_rem(integer, 1000)
    Map.get(@single_ints, div) <> " thousand " <> handle_hundreds(val)
  end

  defp get_div_rem(integer, divisor) do
    {div(integer, divisor), rem(integer, divisor)}
  end
end
