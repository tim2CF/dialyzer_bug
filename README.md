# DialyzerBug

Software versions

```
MacOS 10.15.4
Erlang/OTP 22 [erts-10.6.4]
Elixir (1.10.1)
Dialyxir 1.0.0
```

To reproduce bug on your machine

```shell
git clone git@github.com:tim2CF/dialyzer_bug.git
cd ./dialyzer_bug
mix deps.get
mix test
mix dialyzer
```

and you will see output which is caused by this simple function (which works fine in tests)

```elixir
def hello do
  x =
    quote do
      Map.new()
      |> Map.put(:hello, :world)
    end

  {%{hello: world}, _} = Code.eval_quoted(x)
  world
end
```

error is not expected and type which Dialyzer suggests is weird

```
lib/dialyzer_bug.ex:15:no_return
Function hello/0 has no local return.
________________________________________________________________________________
lib/dialyzer_bug.ex:22:pattern_match
The pattern can never match the type.

Pattern:
{%{:hello => _world}, _}

Type:
{atom() | [any()] | number() | {_, _, _, _}, [{atom() | tuple(), _}]}

________________________________________________________________________________
done (warnings were emitted)
Halting VM with exit status 2
```
