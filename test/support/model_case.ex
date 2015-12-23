defmodule PetObituary.ModelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias PetObituary.Repo
      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import PetObituary.ModelCase
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(PetObituary.Repo, [])
    end

    :ok
  end

  def long_string(length) do
    Enum.reduce (1..length), "", fn _, acc -> acc <> "a" end
  end

  def errors_on(model, data) do
    model.__struct__.changeset(model, data).errors
  end
end
