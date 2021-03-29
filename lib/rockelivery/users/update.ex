defmodule Rockelivery.Users.Update do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "invalid id format"}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> Repo.delete(user)
    end
  end
end
