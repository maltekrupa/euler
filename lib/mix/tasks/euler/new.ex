defmodule Mix.Tasks.Euler.New do
  @moduledoc "Create a code and test template for a specific problem."
  use Mix.Task

  @shortdoc "Create new problem."
  def run([]) do
    IO.puts("[ERROR] Please provide an ID for a problem.")
    IO.puts("          mix euler.new <id>")
  end

  def run([id]) do
    app_dir = File.cwd!()
    module_file_name = "problem_#{id}.ex"
    module_name = "Problem#{id}"

    template_lib_path = Path.join([app_dir, "lib", module_file_name])
    template_test_path = Path.join([app_dir, "test", module_file_name])

    cond do
      File.exists?(template_lib_path) ->
        IO.puts("[ERROR] Problem already exists at #{template_lib_path}.")

      File.exists?(template_test_path) ->
        IO.puts("[ERROR] Problem already exists.")

      true ->
        File.write(
          template_lib_path,
          """
          defmodule #{String.capitalize(module_name)} do
            @moduledoc "TODO: Pull this in from website."

            def run do
              "ZERO IS NOT A NUMBER!"
            end
          end
          """,
          [:write]
        )

        File.write(
          "#{template_test_path}s",
          """
          defmodule #{String.capitalize(module_name)}Test do
            use ExUnit.Case
            doctest #{module_name}

            @moduledoc "TODO: Pull this in from website."

            test "Returns a number" do
              assert #{module_name}.run() == 0
            end
          end
          """,
          [:write]
        )
    end
  end
end
