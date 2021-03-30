defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias Rockelivery.User
  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    response = render(UsersView, "create.json", user: user)

    assert %{message: "User created", user: %User{
      address: "Rua da pascoa", age: 32, cep: "12311231", cpf: "12312312312",
      email: "rrmartinsjg@gmail.com", id: "7425ecb1-a6d4-4737-b2f9-89fae26b5a8b",
      inserted_at: nil, name: "Rodrigo Martins",
      password: "1234546", password_hash: nil, updated_at: nil}} = response
  end
end
