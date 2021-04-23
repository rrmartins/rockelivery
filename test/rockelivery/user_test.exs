defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Rodrigo Martins"}, valid?: true} = response
    end

    test "when updating a changeset, retuns a valid changeset with the given changes" do
      params = build(:user_params)

      update_params = %{
        "name" => "João da Massa",
        "password" => "123456"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "João da Massa"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{"age" => 14, "password" => "123", "cpf" => "123"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        cpf: ["should be 11 character(s)"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
