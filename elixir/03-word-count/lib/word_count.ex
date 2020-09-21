defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    mapAcc = %{}
    wordMap = sentence
    |> lowercase
    |> removeSpecialCharacters
    |> removeConsecutiveSpaces
    |> splitWords
    |> Enum.reduce(
      mapAcc,
      fn word, acc ->
        update_map(
          acc,
          word,
          acc[word]
        )
      end
    )
    wordMap
  end

  def lowercase(sentence), do: String.downcase(sentence)
  def removeSpecialCharacters(sentence), do: String.replace(sentence, [",","!","&","@","$","%","^","&",":",], "")
  def removeConsecutiveSpaces(sentence), do: String.replace(sentence, ~r/\s+/, " ")
  def splitWords(sentence), do: String.split(sentence, [" ","_",])

  def update_map(map, word, nil) do
    Map.put(map, word, 1)
  end
  def update_map(map, word, val) do
    Map.put(map, word, val + 1)
  end
end
