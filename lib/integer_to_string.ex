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

  def convert(0), do: "zero"
  def convert(1), do: "one"
  def convert(2), do: "two"
  def convert(3), do: "three"
  def convert(4), do: "four"
  def convert(5), do: "five"
  def convert(6), do: "six"
  def convert(7), do: "seven"
  def convert(8), do: "eight"
  def convert(9), do: "nine"
  def convert(10), do: "ten"
  def convert(11), do: "eleven"
  def convert(12), do: "twelve"
  def convert(13), do: "thirteen"
  def convert(14), do: "fourteen"
  def convert(15), do: "fifteen"
  def convert(16), do: "sixteen"
  def convert(17), do: "seventeen"
  def convert(18), do: "eighteen"
  def convert(19), do: "nineteen"
  def convert(20), do: "twenty"
  def convert(30), do: "thirty"
  def convert(40), do: "fourty"
  def convert(50), do: "fifty"
  def convert(60), do: "sixty"
  def convert(70), do: "seventy"
  def convert(80), do: "eighty"
  def convert(90), do: "ninety"

  def convert(integer) when rem(integer, 1000) == 0 do
    {div, _val} = get_div_rem(integer, 1000)
    convert(div) <> " thousand"
  end

  def convert(integer) when integer > 1000 do
    {div, val} = get_div_rem(integer, 1000)
    convert(div) <> " thousand " <> convert(val)
  end

  def convert(integer) when integer >= 100 and integer <= 999 and rem(integer, 100) !== 0 do
    {div, val} = get_div_rem(integer, 100)
    convert(div) <> " hundred " <> convert(val)
  end

  def convert(integer) when rem(integer, 100) == 0 do
    {div, _val} = get_div_rem(integer, 100)
    convert(div) <> " hundred"
  end

  def convert(integer) when integer >= 10 and integer <= 99 do
    {div, val} = get_div_rem(integer, 10)
    convert(div * 10) <> "-" <> convert(val)
  end

  defp get_div_rem(integer, divisor) do
    {div(integer, divisor), rem(integer, divisor)}
  end
end
