defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true
  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  import Rockelivery.Factory

  describe "call/1" do
    test "when all params are valid, returns a valid user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 18, email: "douglas@email.com"}} = response
    end

    test "when there are some error, returns an invalid user" do
      params = build(:user_params, %{"age" => 17, "password" => "123"})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
