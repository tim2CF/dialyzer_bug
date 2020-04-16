defmodule DialyzerBug do
  @moduledoc """
  Documentation for `DialyzerBug`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DialyzerBug.hello()
      :world

  """
  def hello do
    x =
      quote do
        Map.new()
        |> Map.put(:hello, :world)
      end

    {%{hello: world}, []} = Code.eval_quoted(x)
    world
  end
end
