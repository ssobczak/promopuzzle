images = [
	Image.create!(name: "starbucks_green", title: "Starbucks green"),
	Image.create!(name: "starbucks_blue", title: "Starbucks blue"),
	Image.create!(name: "starbucks_red", title: "Starbucks red")
]

u1 = User.create!(name: "Jozin")
15.times { Part.create!(user: u1, position: rand(9), image: images[rand(3)]) }

u2 = User.create!(name: "Maryna")
20.times { Part.create!(user: u2, position: rand(9), image: images[rand(3)]) }