# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# run 10 times
10.times do |blog|
	Blog.create!(
		title: "My Blog Post #{blog}",
		body: "This file is auto-generated from the current state of the database. Instead
			of editing this file, please use the migrations feature of Active Record to
			incrementally modify your database, and then regenerate this schema definition.		
			Note that this schema.rb definition is the authoritative source for your
			database schema. If you need to create the application database on another
			system, you should be using db:schema:load, not running all the migrations
			from scratch. The latter is a flawed and unsustainable approach (the more migrations
			you'll amass, the slower it'll run and the greater likelihood for issues)."

	)
end

puts "10 blog posts created"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		percent_utilized: 15
	)
end

puts "5 skills created"

9.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio title: #{portfolio_item}",
		subtitle: "My great service",
		body: "This file is auto-generated from the current state of the database. Instead
			of editing this file, please use the migrations feature of Active Record to
			incrementally modify your database, and then regenerate this schema definition.",
		main_image: "https://http://placehold.it/600x400",
		thumb_image: "https://http://placehold.it/350x200"
	)
end

puts "9 portfolio items created"