defmodule Sequence.Server do
  use GenServer

  # Client API

  def start_link(number) do
    GenServer.start_link(__MODULE__, number, name: __MODULE__)
  end

  def next_number() do
    GenServer.call(__MODULE__, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast(__MODULE__, {:increment_number, delta})
  end

  # Callbacks

  def init(args) do
    {:ok, args}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number + 1, current_number + 1}
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end
end
