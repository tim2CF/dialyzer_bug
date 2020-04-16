# DialyzerBug

To reproduce bug on your machine

```elixir
git clone git@github.com:tim2CF/dialyzer_bug.git
cd ./dialyzer_bug
mix deps.get
mix test
mix dialyzer
```

and you will see output (error is not expected and type which Dialyzer suggests is weird)

```
lib/dialyzer_bug.ex:15:no_return
Function hello/0 has no local return.
________________________________________________________________________________
lib/dialyzer_bug.ex:22:pattern_match
The pattern can never match the type.

Pattern:
{%{:hello => _world}, []}

Type:
{atom() | [any()] | number() | {_, _, _, _}, [{atom() | tuple(), _}]}

________________________________________________________________________________
done (warnings were emitted)
Halting VM with exit status 2
```
