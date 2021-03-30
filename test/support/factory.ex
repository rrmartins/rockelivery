defmodule Rockelivery.Factory do
  use ExMachina

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

end
