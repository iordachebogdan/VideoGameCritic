5.times do
  Game.create({
    name: Faker::Book.title,
    description: Faker::Lorem.sentence
  })
end

5.times do
  Console.create({
    name: Faker::Book.title,
    description: Faker::Lorem.sentence
  })
end
