defmodule Problem2 do
  @moduledoc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, \dots

  By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
  """

  @spec run(integer) :: integer
  def run(0), do: 0

  # fn for tests
  def run(input) do
    input
    |> do_run_tuple({2, 1})
  end

  # fn for benchee
  def run_list(input) do
    input
    |> do_run_list([2, 1])
  end

  # fn for benchee
  def run_tuple(input) do
    input
    |> do_run_tuple({2, 1})
  end

  @spec do_run_list(integer, [integer]) :: integer
  defp do_run_list(limit, [a | _rest] = acc) when a >= limit do
    acc
    |> Enum.filter(fn x -> rem(x, 2) == 0 end)
    |> Enum.sum()
  end

  defp do_run_list(limit, [a, b | _c] = d) do
    do_run_list(limit, [a + b | d])
  end

  @spec do_run_tuple(integer, {integer, integer}, integer) :: integer
  defp do_run_tuple(limit, acc, sum \\ 0)
  defp do_run_tuple(limit, {a, _b}, sum) when a > limit, do: sum

  defp do_run_tuple(limit, {a, b}, sum) when rem(a, 2) == 0 do
    do_run_tuple(limit, {a + b, a}, sum + a)
  end

  defp do_run_tuple(limit, {a, b}, sum) do
    do_run_tuple(limit, {a + b, a}, sum)
  end
end
