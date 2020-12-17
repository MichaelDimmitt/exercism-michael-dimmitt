defmodule BeerSong do
  import String, only: [ capitalize: 1, trim_leading: 2 ]
  def refrain(0), do: "Go to the store and buy some more"
  def refrain(1), do: "Take it down and pass it around"
  def refrain(_), do: "Take one down and pass it around"

  defp bottle(0),  do: "no more bottles"
  defp bottle(1),  do: "1 bottle"
  defp bottle(-1), do: bottle(99)
  defp bottle(n),  do: "#{n} bottles"

  def verse(n) do
    """
    #{ bottle(n) |> capitalize } of beer on the wall, #{ bottle(n) } of beer.
    #{ refrain(n) }, #{ bottle(n - 1) } of beer on the wall.
    """
  end

  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &(verse(&1)) )
    |> trim_leading("\n")
  end

end
