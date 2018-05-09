defmodule Cards do
  def new_deck(), do: new_deck({"C","2"}, [])
  def new_deck({"C","15"},l), do: new_deck({"D","2"}, [{"C","15"}|l])
  def new_deck({"D","15"},l), do: new_deck({"H","2"}, [{"D","15"}|l])
  def new_deck({"H","15"},l), do: new_deck({"S","2"}, [{"H","15"}|l])
  def new_deck({"S","15"},l), do: [{"S","15"}|l]
  def new_deck({ps,pr},l) do
    nr = String.to_integer(pr)+1
      new_deck({ps,to_string(nr)},[{ps,pr}|l])
  end


  def shuffle(l) do
    Enum.shuffle(l)
  end


  def deal(d), do: deal(d,{0,0},0)
  def deal(l,a,26), do: {a,l}
  def deal([h|t],a,n) do
    deal(t,[h|a],n+1)
  end

  def two_hands() do
    new_deck |> shuffle() |>deal()
  end
end
