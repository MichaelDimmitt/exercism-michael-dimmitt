defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    wordMap = sentence
    |> lowercase
    |> removeSpecialCharacters
    |> removeConsecutiveSpaces
    |> splitWords
    |> Enum.reduce(
      %{},
      fn word, acc ->
        map_update(
          acc,
          word
        )
      end
    )
    wordMap
  end

  def lowercase(sentence), do: String.downcase(sentence)
  def removeSpecialCharacters(sentence), do: String.replace(sentence, [",","!","&","@","$","%","^","&",":",], "")
  def removeConsecutiveSpaces(sentence), do: String.replace(sentence, ~r/\s+/, " ")
  def splitWords(sentence), do: String.split(sentence, [" ","_",])

  # def update_map(map, word, nil) do
  #   Map.put(map, word, 1)
  # end
  # def update_map(map, word, val) do
  #   Map.put(map, word, val + 1)
  # end
  @spec map_update(map, binary) :: map
  def map_update(map, word) do
    Map.update(map, word, 1, &(&1 + 1))
  end
end
