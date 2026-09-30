require 'faker'

4.times do
  burger = Burger.create!(
    name: "#{Faker::Food.dish} Burger",
    price: Faker::Number.between(from: 20, to: 80),
    stock: Faker::Number.between(from: 10, to: 200),
    size: Burger::SIZES.sample
  )

  4.times do
    burger.extras.create!(
      name: Faker::Food.ingredient,
      price: Faker::Number.between(from: 2, to: 10)
    )
  end
end