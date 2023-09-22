defmodule Problem1Test do
  use ExUnit.Case
  doctest Problem1

  @moduledoc """
  If we list all the natural numbers below $10$ that are multiples of $3$ or $5$, we get $3, 5, 6$ and $9$. The sum of these multiples is $23$.

  Find the sum of all the multiples of $3$ or $5$ below $1000$.
  """

  test "Returns a number" do
    assert Problem1.run(0) == 0
  end

  test "Returns example number" do
    assert Problem1.run(10) == 23
  end

  test "Returns 1000" do
    assert Problem1.run(1000) == 233_168
  end
end
