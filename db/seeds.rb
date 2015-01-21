# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.create(
					[
						{
							name: 			"Swatch Watch",
							price_in_pence: "5000",
							description: 	"It tells the time and EVERYTHING!!"

						},
						 {
						 	name: 			"Beanie Hat",
							price_in_pence: "800",
							description: 	"It's a warm hat that keeps the top of your head warm in winter "

						 }
					]
				)