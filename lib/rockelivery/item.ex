defmodule Rockelivery.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum

  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}

  @require_params [:category, :description, :price, :photo]
  @items_categories [:food, :desert, :drink]

  @derive {Jason.Encoder, only: @require_params ++ [:id]}

  schema "items" do
    field :category, Enum, values: @items_categories
    field :description, :string
    field :price, :decimal
    field :photo, :string

    many_to_many :orders, Order, join_through: "orders_items"

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
    |> validate_length(:description, min: 5)
    |> validate_number(:price, greater_then: 0)
  end
end
