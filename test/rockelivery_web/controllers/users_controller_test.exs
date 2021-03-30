defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 32,
        "address" => "Rua da pascoa",
        "cep" => "12311231",
        "cpf" => "12312312312",
        "email" => "rrmartinsjg@gmail.com",
        "password" => "1234546",
        "name" => "Rodrigo Martins"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "Rua da pascoa",
                 "age" => 32,
                 "cpf" => "12312312312",
                 "email" => "rrmartinsjg@gmail.com",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns teh error", %{conn: conn} do
      params = %{
        "age" => 14,
        "password" => "1234546",
        "name" => "Rodrigo Martins"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["must be greater than or equal to 18"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "7425ecb1-a6d4-4737-b2f9-89fae26b5a8b"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
