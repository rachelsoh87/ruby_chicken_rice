require 'byebug'

class Wok

	def initialize
		@chicken_being_cooked = []
	end

	def fry(cook_time)
		for chicken in @chicken_being_cooked
			chicken.time_fried += cook_time 
			p @chicken_being_cooked
		end
	end

	def insert(chicken)
		@chicken_being_cooked << chicken
	end

	def remove
		@chicken_being_cooked.delete_at(0)
		p @chicken_being_cooked
	end
end



class Chicken
	attr_accessor :time_fried
	def initialize
		@time_fried = 0
	end

	def status
		if @time_fried < 5
			"raw"
		elsif @time_fried < 8
			"almost ready"
		elsif @time_fried == 10
			"ready"
		elsif @time_fried > 10
			"burned"
		end 
	end
end

class RiceCooker
	
	def initialize
		@time_boiled = 0
		@rice_cooker_in_use = false
		@cooked_rice = 0
	end

	def insert_rice
		@cooked_rice = 0 #reset cooked rice 
		if @rice_cooker_in_use == true
			p "sorry, the rice cooker is full right now"
		else
			@rice_cooker_in_use = true
			p "You have put raw rice into the rice cooker"
		end
	end

	def boil(time_boiled)
		if @rice_cooker_in_use == true
			@time_boiled += time_boiled
			p "The rice has been boiling for #{time_boiled} minutes."
		end
	end

	def remove_rice
		@rice_cooker_in_use = false
		@time_boiled = 0
		@cooked_rice += 1
		p "The rice cooker is now empty and a new batch of raw rice can be put in if you'd like"
	end

end

class Rice
end


#cook chicken
wok_1 = Wok.new
chicken_1 = Chicken.new
chicken_2 = Chicken.new
wok_1.insert(chicken_1)
wok_1.insert(chicken_2)
wok_1.fry(5)
p chicken_1.status
wok_1.fry(5)
p chicken_2.status
wok_1.remove
wok_1.remove

#boil rice
rice_cooker_1 = RiceCooker.new
rice_1 = Rice.new
rice_cooker_1.insert_rice
rice_cooker_1.insert_rice
rice_cooker_1.boil(10)
rice_cooker_1.remove_rice
p rice_cooker_1






