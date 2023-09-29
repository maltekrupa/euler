Benchee.run(
  %{
    "list" => fn -> Problem2.run_list(4_000_000) end,
    "tuple" => fn -> Problem2.run_tuple(4_000_000) end,
  }
)
