defmodule Bob do
  @doc """
    1. removeTrailningSpaces
    2. isEmpty                       - "Fine. Be that way!"
    3. lastCharacterIs ?
      4. lastConsenantIs Caps        - "Calm down, I know what I'm doing!"
      5. lastConsenantIs lowercase   - "Sure."
    6  lastCharacterIs - specialCharacter not ?
      7. lastConsenantIs - lowercase - "Whatever."
      8. lastConsenantIs - uppercase - "Whoa, chill out!"
  """

  def hey(input) do
    react(String.trim(input))
  end
  def react(""), do: "Fine. Be that way!"
  def react(d) do
    uppercase   = String.upcase(d) == d
    has_letters = String.match?(d, ~r/[[:alpha:]]/ui)
    question    = String.last(d) == "?"

    cond do
      uppercase && has_letters && question -> "Calm down, I know what I'm doing!"
      uppercase && has_letters -> "Whoa, chill out!"
      question -> "Sure."
      true -> "Whatever."
    end
  end
end
