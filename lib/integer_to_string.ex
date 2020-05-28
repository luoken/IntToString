defmodule IntegerToString do
  @moduledoc """
    Handles the logic to convert a integer from 0 - 9999 into it's string representation.

    Example:
      > IntegerToString.convert_to_string(8000)
      "eight thousand"
  """

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
    div = div(integer, 1000)
    convert(div) <> " thousand"
  end

  def convert(integer) when integer > 1000 do
    div = div(integer, 1000)
    val = rem(integer, 1000)
    convert(div) <> " thousand " <> convert(val)
  end

  def convert(integer) when rem(integer, 100) == 0 do
    div = div(integer, 100)
    convert(div) <> " hundred"
  end

  def convert(integer) when integer >= 100 and integer <= 999 do
    div = div(integer, 100)
    val = rem(integer, 100)
    convert(div) <> " hundred " <> convert(val)
  end

  def convert(integer) when integer >= 10 and integer <= 99 do
    div = div(integer, 10)
    val = rem(integer, 10)
    convert(div * 10) <> "-" <> convert(val)
  end
end
