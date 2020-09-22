defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split([" ","_",",","!","&","@","$","%","^","&",":"], trim: true)
    |> Enum.reduce( %{}, fn word, acc -> map_update( acc, word ) end )
  end

  @spec map_update(map, binary) :: map
  def map_update(map, word) do
    Map.update(map, word, 1, &(&1 + 1))
  end
end
