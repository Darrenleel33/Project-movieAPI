require 'faker'

puts "Clearing old data..."
Movie.destroy_all
User.destroy_all
Booking.destroy_all


puts "Repopulating Movies..."

Movie.create( 
  title: "Black Widow",
  release_date: "07/09/2021",
  description: "Natasha Romanoff, aka Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy, and the broken relationships left in her wake long before she became an Avenger."
)
Movie.create( 
  title: "Space Jam: A New Legacy",
  release_date: "07/21/2021",
  description: "Superstar LeBron James and his young son, Dom, get trapped in digital space by a rogue AI. To get home safely, LeBron teams up with Bugs Bunny, Daffy Duck and the rest of the Looney Tunes gang for a high-stakes basketball game against the AI's digitized champions of the court -- a powered-up roster called the Goon Squad."
)
Movie.create( 
  title: "The Boss Baby: Family Business",
  release_date: "07/02/2021",
  description: "Now adults, Tim Templeton is a stay-at-home dad for two adorable daughters, while his estranged brother, Ted, is a big-shot CEO. They come together in an unexpected way when they take a magical formula that transforms them into babies for 48 hours."
)
Movie.create( 
  title: "Escape Room: Tournament of Champions",
  release_date: "07/16/2021",
  description: "Survivors of previous escape rooms find themselves in a new and increasingly elaborate game filled with deadly traps."
)
Movie.create( 
  title: "F9",
  release_date: "06/25/2021",
  description: "Dom Toretto is living the quiet life off the grid with Letty and his son, but they know that danger always lurks just over the peaceful horizon. This time, that threat forces Dom to confront the sins of his past to save those he loves most."
)
Movie.create( 
  title: "The Forever Purge",
  release_date: "07/02/2021",
  description: "Adela and her husband, Juan, live in Texas, where he works as a ranch hand for the wealthy Tucker family. Juan impresses the Tucker patriarch, Caleb, but that fuels the jealous anger of his son, Dylan. "
)


puts "Repopulating Users..."

8.times do
    User.create(
        name: Faker::Name.name,
        username: Faker::Internet.username(specifier: 5..10),
        password: Faker::Internet.password(min_length: 8, max_length: 13),
        adult: Faker::Boolean.boolean
        ) 
end


puts "Assembling booking table..."
20.times do
Booking.create(
    user_id:User.ids.sample,
    movie_id:Movie.ids.sample,
    showtime: Faker::Time.forward(days: 5,  period: :evening, format: :long),
    seats_available:rand(1..60)
)
end


puts "Done!"