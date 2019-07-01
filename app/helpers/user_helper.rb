module UserHelper
	NAMES = [ "Attend", "Thank", "Steer", "Futuristic", "Frantic", "Boiling", "Book", "Strange", "Dusty", "Respect", "Stocking", "Man", "Produce", "Soup", "Juvenile", "Knotty", "Hook", "Harsh", "Round", "Beds", "Line", "Place", "Towering", "Moor", "Wonderful", "Air", "Listen", "Pear", "Short", "Complete", "Match", "Voracious", "Kick", "Adventurous", "Near", "Road", "Mark", "Icy", "Continue", "Quixotic", "Spark", "Jar", "Pray", "Lock", "Street", "Work", "Troubled", "Perfect", "Veil", "Oatmeal", "Brick", "Innocent", "Like", "Beginner", "Accept", "Desk", "Boring", "Rush", "Spiteful", "Mint", "Type", "Lamp", "Cause", "Helpful", "Giants", "Holistic", "Dinosaurs", "Zinc", "Tremendous", "Stone", "Zonked", "Night", "Judge", "Sweltering", "Fantastic", "Divergent", "Shocking", "Stale", "Board", "Thunder", "Remarkable", "Lively" ]

	def generate_username
		begin
			name = 3.times.map { NAMES.sample }.join
		end unless User.find_by_name( name )
	end
end
