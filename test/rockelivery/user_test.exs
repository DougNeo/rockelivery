defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.User
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{
               valid?: true,
               changes: %{
                 age: 18,
                 address: "Rua do Teste",
                 cep: "12345678",
                 cpf: "12345678901",
                 email: "douglas@email.com",
                 name: "Douglas"
               }
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{"age" => 17, "password" =>"123"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      update_params = %{"name" => "Douglão", "age" => 32}

      changeset = User.changeset(params)

      response = User.changeset(changeset, update_params)

      assert %Changeset{
               valid?: true,
               changes: %{
                 age: 32,
                 address: "Rua do Teste",
                 cep: "12345678",
                 cpf: "12345678901",
                 email: "douglas@email.com",
                 name: "Douglão"
               }
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params)

      update_params = %{"cep" => "1234567", "age" => 17}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        cep: ["should be 8 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
