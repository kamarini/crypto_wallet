#Use o rails dev:setup (lib/tasks/dev.rake)
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


coins = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"
            },

          {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/256px-Ethereum_logo_2014.svg.png"
          },

          {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsJnpKnbWwJsEO9E7VxR6cTXgb4xjbzudPvqjVXrMsYuBfOOVK"
          }
        ]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end
