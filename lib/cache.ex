defmodule Cache do
  use GenServer

  @name Cache

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [name: @name])
  end

  # API
  def write(key, value) do
    GenServer.cast(@name, {:write, key, value})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.cast(@name, {:delete, key})
  end

  def clear do
    GenServer.cast(@name, {:clear})
  end

  def exist?(key) do
    GenServer.call(@name, {:exist, key})
  end

  # Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:write, key, value}, cache) do
    cache = Map.put(cache, key, value)
    {:noreply, cache}
  end

  def handle_cast({:delete, key}, cache) do
    cache = Map.delete(cache, key)
    {:noreply, cache}
  end

  def handle_cast({:clear}, _cache) do
    {:noreply, %{}}
  end

  def handle_call({:read, key}, _from, cache) do
    value = Map.fetch(cache, key)
    {:reply, value, cache}
  end

  def handle_call({:exist, key}, _from, cache) do
    reply = Map.has_key?(cache, key)
    {:reply, reply, cache}
  end

end
