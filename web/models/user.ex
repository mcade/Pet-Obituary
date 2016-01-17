defmodule PetObituary.User do
  use PetObituary.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :number_of_pets, :integer

    timestamps
  end

  @required_fields ~w(email)
  @optional_fields ~w(name number_of_pets bio)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:bio, min: 2)
    |> validate_length(:bio, max: 140)
    |> validate_format(:email, ~r/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
    |> unique_constraint(:email)
  end
end
