defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  # @spec to_rna([char]) :: [char]
  # The first to_rna can be excluded, it saves a single call to Enum.map
  # def to_rna([dna]) do
  #   [ conversion_map(dna) ]
  # end
  # def to_rna(dna) do
  #   convert_list(dna)
  # end
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &conversion_map/1)
  end

  @spec conversion_map(char) :: char
  def conversion_map(dna) do
    %{
      ?G=>?C,
      ?C=>?G,
      ?T=>?A,
      ?A=>?U
    }[dna]
  end

  # @spec convert_list([char]) :: [char]
  # def convert_list(input) do
  #   Enum.map(input, conversion_map(x)  end)
  # end


  # @spec convert_chars_to_octal(any, any) :: [any]
  # def convert_chars_to_octal(expectedInputs, expectedOutputs) do
  #   listy = expectedInputs ++ expectedOutputs
  #   listy |>
  #   Enum.uniq() |>
  #   Enum.map(fn(x) -> IO.inspect({<<x::utf8>>, x})  end)
  # end
  # generates the following:
  #   {"A", 65}
  #   {"C", 67}
  #   {"G", 71}
  #   {"T", 84}
  #   {"U", 85}

  # old implementation:
  #   def to_rna('G'), do: 'C'
  #   def to_rna('C'), do: 'G'
  #   def to_rna('T'), do: 'A'
  #   def to_rna('A'), do: 'U'

end
# RnaTranscription.convert_chars_to_octal('ACGTGGTCTTAA', 'UGCACCAGAAUU')
