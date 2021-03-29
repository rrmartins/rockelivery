defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 32,
        address: "Rua da pascoa",
        cep: "12311231",
        cpf: "12312312312",
        email: "rrmartinsjg@gmail.com",
        password: "1234546",
        name: "Rodrigo Martins"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Rodrigo Martins"}, valid?: true} = response
    end

    test "when updating a changeset, retuns a valid changeset with the given changes" do

    end

    test "when there are some error, returns an invalid changeset" do

    end
  end


end
