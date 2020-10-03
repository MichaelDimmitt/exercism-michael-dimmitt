defmodule RomanNumerals do
  @numeralMap %{
    1=>"I",
    5=>"V",
    10=>"X",
    50=>"L",
    100=>"C",
    500=>"D",
    1000=>"M"
  }

  # Notes

  # Visualizing Roman Numeral base values.
  # 1 - 3 # I  - III
  # 4 - 8 # IV - VIII
  # 9 - 10 # IX - X

  # 9 - 13 # IX - XIII

  # use tens place to access numericalMap
  # *1
  # *10
  # *100

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    # https://github.com/elixir-cldr/cldr_numbers
    # MyApp.Cldr.Number.to_string 123, format: :roman
    nextTen(number, 1)
  end

  def nextTen(number, tensPlace) do
    nextNumber = floor(number/10)
    # IO.inspect([ nextNumber, rem(number, 10), tensPlace])

    if (number <= 10) do
      handleDigit(number, tensPlace)
    else
      digit = rem(number, 10)
      nextTen( nextNumber, tensPlace*10 ) <> handleDigit(digit, tensPlace)
    end

  end

  def handleDigit(number, tensPlace) do
    cond do
      (number <= 3) ->
        getNumerals(1, tensPlace, number)
      (number <= 5) ->
          getNumerals(1, tensPlace, 5 - number) <> getNumerals(5, tensPlace)
      (number <= 8) ->
        getNumerals(5, tensPlace) <> getNumerals(1, tensPlace, number - 5)
      (number <= 10) ->
        getNumerals(1, tensPlace, 10 - number) <> getNumerals(10, tensPlace)
    end
  end

  def getNumerals(num, tensPlace, repeatedValues \\ 1) do
    @numeralMap[num*tensPlace]
    |> String.duplicate(repeatedValues)
  end

end
