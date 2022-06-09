defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"

    response = render(UsersView, "create.json", user: user, token: token)

    assert %{
             token: "xpto1234",
             message: "User created",
             user: %Rockelivery.User{
               address: "Rua do Teste",
               age: 18,
               cep: "12345678",
               cpf: "12345678901",
               email: "douglas@email.com",
               id: "2c508cc3-1d13-4080-895a-691f66b954f8",
               inserted_at: nil,
               name: "Douglas",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end

  test "renders user.json" do
  end
end
