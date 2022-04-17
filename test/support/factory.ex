defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "age" => 18,
      "address" => "Rua do Teste",
      "cep" => "12345678",
      "cpf" => "12345678901",
      "email" => "douglas@email.com",
      "password" => "123456",
      "name" => "Douglas"
    }
  end

  def user_factory do
    %User{
      age: 18,
      address: "Rua do Teste",
      cep: "12345678",
      cpf: "12345678901",
      email: "douglas@email.com",
      password: "123456",
      name: "Douglas",
      id: "2c508cc3-1d13-4080-895a-691f66b954f8"
    }
  end
end
