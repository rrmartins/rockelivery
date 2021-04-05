defmodule Rockelivery.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum
  alias Rockelivery.{Item, User}

  @primary_key {:id, :binary_id, autogenerate: true}

  @require_params [:address, :comments, :payment_method, :user_id]
  @payment_methods [:money, :credit_card, :debit_card]

  @derive {Jason.Encoder, only: @require_params ++ [:id]}

  schema "orders" do
    field :address, :string
    field :comments, :string
    field :payment_method, Enum, values: @payment_methods

    many_to_many :items, Item, join_through: "orders_items"
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, items) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
    |> put_assoc(:items, items)
    |> validate_length(:comments, min: 5)
    |> validate_length(:address, min: 5)
  end
end