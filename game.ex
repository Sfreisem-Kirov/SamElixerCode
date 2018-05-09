defmodule Game do
  def init() do
    {a,b}=Cards.two_hands
    %{rounds_left: 100,
      game_state: :playing,
      p1: %{
        down: a,
        up: []
      },
      p2: %{
        down: b,
        up: [],
      }
    }
  end


  def take_turn(gs,cp,op) do
    if 0 == gs[:rounds_left] do
      if  Kernel.length([gs[cp[:down]]++gs[cp[:up]]])>Kernel.length([gs[op[:down]]++gs[op[:up]]]) do
        "#{cp} Wins"
      end
      if Kernel.length([gs[cp[:down]]++gs[cp[:up]]])==Kernel.length([gs[op[:down]]++gs[op[:up]]]) do
        "It is a Tie!"
      end
      if Kernel.length([gs[cp[:down]]++gs[cp[:up]]])<Kernel.length([gs[op[:down]]++gs[op[:up]]]) do
        "#{op} Wins"
      end
    end
    if gs[cp[:down]] == 0 do
      if gs[cp[:up]] == 0 do
        "#{op} wins"
      else
        Map.put(gs[cp],:down,gs[cp[:up]])
        Map.put(gs[cp],:up,0)
      end
    end

    %{down: [h|t],up: b } = gs[cp]
    cm= %{down: t,up: [h|b]} #give current player's head of down to up

    Map.merge(gs,cp,cm) #merge it with the old player

    [oh|ot] = gs[op[:up]]
    if h=oh do
      snap(gs,h,oh,cp,op)
      IO.puts("snap")
    else
      ugs=gs
      ugs[:rounds_left = gs[:rounds_left]-1]
      take_turn(ugs,op,cp)
    end
  end


  def snap(gs,h,oh,cp,op) do
    r = :rand.uniform()
    if(r<0.5) do
      tot=gs[cp[:down]]++gs[cp[:up]]++gs[op[:up]]
      Map.put(gs[cp],:down,tot)
      Map.put(gs[cp],:up,0)
      Map.put(gs[op],:up,0)
    else
      tot=gs[op[:down]]++gs[cp[:up]]++gs[op[:up]]
      Map.put(gs[op],:down,tot)
      Map.put(gs[cp],:up,0)
      Map.put(gs[op],:up,0)
    end
  end
end
