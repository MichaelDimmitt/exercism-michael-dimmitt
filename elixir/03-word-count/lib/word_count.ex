defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    mapAcc = %{}
    shortString = String.replace(sentence, [",","!","&","@","$","%","^","&",":",], "")
    singleSpaceString = String.replace(shortString, ~r/\s+/, " ")
    words = String.split(singleSpaceString, [" ","_",])
    wordMap = Enum.reduce(
      words,
      mapAcc,
      fn word, acc ->
        update_map(
          acc,
          String.downcase(word),
          acc[String.downcase(word)]
        )
      end
    )
    wordMap
  end
  # word = String.downcase(word),
  def update_map(map, word, nil) do
    Map.put(map, word, 1)
  end
  def update_map(map, word, val) do
    Map.put(map, word, val + 1)
  end
end
