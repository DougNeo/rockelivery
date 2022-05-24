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

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
