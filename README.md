# Cache
```
iex(1)> Cache.start_link
{:ok, #PID<...>}
iex(2)> Cache.write(:instruments, ["Guitar", "Bass", "Drums"])
:ok
iex(3)> Cache.write(:languages, ["Spanish", "English"])
:ok
iex(4)> Cache.read(:instruments)
{:ok,["Guitar", "Bass", "Drums"]}
iex(5)> Cache.delete(:instruments)
:ok
iex(6)> Cache.exist?(:languages)
true
iex(7)> Cache.clear
:ok
iex(8)> Cache.exist?(:languages)
false
```
