# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Label.create(name: 'Ruby On Rails')
Label.create(name: 'GIFs')

3.times do |i|
  a = Article.create!(
    title: 'Hello, world!',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    published_on: Date.today - i.days
  )

  a.labels << Label.find_by(name: 'Ruby On Rails')
  a.labels << Label.find_by(name: 'GIFs')
end

SocialLink.create(
  caption: 'GitHub',
  href: 'https://github.com/dominicgoulet',
  svg_path: 'github'
)

SocialLink.create(
  caption: 'LinkedIn',
  href: 'https://linkedin.com/in/dominicgoulet/',
  svg_path: 'linkedin'
)

SocialLink.create(
  caption: 'Stack Overflow',
  href: 'https://stackoverflow.com/users/452792/dominic-goulet',
  svg_path: 'stackoverflow'
)
