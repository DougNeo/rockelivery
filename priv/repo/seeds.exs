# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rockelivery.Repo.insert!(%Rockelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Rockelivery.{Item, Order, Repo, User}

user = %User{
  age: 27,
  address: "Rua dos bobos, 0",
  cep: "29175754",
  cpf: "12345678900",
  email: "doguera@email.com",
  password: "123456",
  name: "Doguera"
}

%User{id: user_id} = Repo.insert!(user)

item1 = %Item{
  category: :food,
  description: "Arroz com Feijão",
  price: Decimal.new("10.90"),
  photo: "priv/photos/arroz_com_feijao"
}

item2 = %Item{
  category: :food,
  description: "Arroz com Ervilha",
  price: Decimal.new("12.90"),
  photo: "priv/photos/arroz_com_ervilha"
}

Repo.insert!(item1)
Repo.insert!(item2)

order = %Order{
  user_id: user_id,
  items: [item1, item1, item2],
  address: "Rua dos Marrecos, 15",
  comments: "Feijão e ervilha por cima",
  payment_method: :money
}

Repo.insert!(order)
