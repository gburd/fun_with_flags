defmodule FunWithFlags.Store.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, nil, [name: __MODULE__])
  end

  def init(_) do
    children = [
      worker(FunWithFlags.Store.Cache, [], restart: :permanent),
      worker(FunWithFlags.Store.Persistent, [], restart: :permanent)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
