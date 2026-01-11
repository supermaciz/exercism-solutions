defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits =
      number
      |> Integer.to_charlist()
      |> Enum.map(&(&1 - 48))

    len = length(digits)

    sum =
      digits
      |> Enum.map(&(&1 ** len))
      |> Enum.sum()

    number == sum
  end
end
