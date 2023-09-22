defmodule Problem1 do
  @moduledoc """
  If we list all the natural numbers below $10$ that are multiples of $3$ or $5$, we get $3, 5, 6$ and $9$. The sum of these multiples is $23$.

  Find the sum of all the multiples of $3$ or $5$ below $1000$.
  """

  @spec run(integer) :: integer
  def run(0), do: 0

  def run(input) do
    1..(input - 1)
    |> Enum.to_list()
    |> do_run
  end

  @spec do_run([integer], [integer]) :: integer
  defp do_run(input, acc \\ [])
  defp do_run([], acc), do: Enum.sum(acc)

  defp do_run([h | t], acc) do
    case Kernel.rem(h, 3) == 0 or Kernel.rem(h, 5) == 0 do
      true -> do_run(t, [h | acc])
      false -> do_run(t, acc)
    end
  end
end
