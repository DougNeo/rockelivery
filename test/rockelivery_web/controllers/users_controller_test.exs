defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Mox
  import Rockelivery.Factory

  alias RockeliveryWeb.Auth.Guardian
  alias Rockelivery.ViaCep.ClientMock

  describe "create/2" do
    test "when al params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "Rua do Teste",
                 "age" => 18,
                 "cpf" => "12345678901",
                 "email" => "douglas@email.com",
                 "id" => _id,
                 "name" => "Douglas"
               }
             } = response
    end

    # test "when there are is some error, returns the error", %{conn: conn} do
    #   params = build(:user_params, cpf: "123456789")

    #   response =
    #     conn
    #     |> post(Routes.users_path(conn, :create, params))
    #     |> json_response(:bad_request)

    #   expected_response = %{"message" => %{"cpf" => ["should be 11 character(s)"]}}

    #   assert response == expected_response
    # end
  end

  describe "show/2" do
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn, user: user}
    end

    test "when the user exists, deletes the user", %{conn: conn} do
      id = "2c508cc3-1d13-4080-895a-691f66b954f8"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end

  describe "update/2" do
  end
end
