defmodule IntegerToStringTest do
  use ExUnit.Case
  alias IntegerToString

  describe "convert/1" do
    test "converts 432 to its string text" do
      assert "four hundred thirty-two" = IntegerToString.convert(432)
    end

    test "converts 4_000 to the string value" do
      assert "four thousand" = IntegerToString.convert(4_000)
    end

    test "unable to convert values over 1_000_000" do
      assert "Cannot convert value that is greater than or equal to 1 million" =
               IntegerToString.convert(1_000_000)
    end

    test "converts 543300 to string value" do
      assert "five hundred fourty-three thousand three hundred" = IntegerToString.convert(543_300)
    end

    test "converts 500_000 to string" do
      assert "five hundred thousand" = IntegerToString.convert(500_000)
    end

    test "converts 400 to string" do
      assert "four hundred" = IntegerToString.convert(400)
    end

    test "converts 928_374 to string" do
      assert "nine hundred twenty-eight thousand three hundred seventy-four" =
               IntegerToString.convert(928_374)
    end

    test "converts 2348 to string" do
      assert "two thousand three hundred fourty-eight" = IntegerToString.convert(2348)
    end
  end
end
