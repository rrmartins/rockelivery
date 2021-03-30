defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 32,
      address: "Rua da pascoa",
      cep: "12311231",
      cpf: "12312312312",
      email: "rrmartinsjg@gmail.com",
      password: "1234546",
      name: "Rodrigo Martins"
    }
  end

  def user_factory do
    %User{
      age: 32,
      address: "Rua da pascoa",
      cep: "12311231",
      cpf: "12312312312",
      email: "rrmartinsjg@gmail.com",
      password: "1234546",
      name: "Rodrigo Martins",
      id: "7425ecb1-a6d4-4737-b2f9-89fae26b5a8b"
    }
  end
end
