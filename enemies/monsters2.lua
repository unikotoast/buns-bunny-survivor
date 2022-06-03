
function bunny(start_time)
	return make_wave(
		function() return {
		sprite = 203,
		death_sprite = 103,
		speed = 0, 
		hp = 6,
		no_teleport = true,
		can_attack = false,
		death_item = make_peach,
		pos = {x=0, y=0}
	} end,
		start_time,
		1,
		1
	)
end


function bomb_wave(start_time, num, interval)
	return make_wave(
		function() return {
		sprite = 41,
		death_sprite = 104,
		speed = 0.4, 
		no_teleport = true,
		hp = 1,
		is_bomb = true,
		dmg = .5
	}  end,
		start_time,
		interval,
		num
	)
end

function jellies_acid_wave(start_time, num, interval)
	return make_wave(
		function() return {
		sprite = 181,
		death_sprite = 183,
		speed = 0.25, 
		hp = 10+enemy_level*3,
		dmg = 4,
		life_time = 1400,
		spawn_count = 3,
		spawn = jelly_acid
	}  end,
		start_time,
		interval,
		num
	)
end


function jelly_acid()
	return {
		sprite = 94,
		death_sprite = 183,
		speed = .2, 
		life_time = 1000,
		hp = 5+enemy_level*2,
		dmg = 4,
	}
end

function chick_wave(start_time, num, interval, shine)
	return make_wave(
		function() return {
		sprite = 187,
		death_sprite = 173,
		speed = 0.25+enemy_level/100, 
		hp = 10,
		dmg = 2,
		can_shine = shine
	}  end,
		start_time,
		interval,
		num
	)
end

 
function mushroom_wave(start_time, num, interval)
	return make_wave(
		function() return {
		sprite = 157,
		death_sprite = 61,
		speed = 0.2, 
		hp = 40+enemy_level*7,
		dmg = 5,
		spawn_count = 3,
		spawn = mushroom_small
	}  end,
		start_time,
		interval,
		num
	)
end

function mushroom_small()
	return {
		sprite = 141,
		death_sprite = 173,
		speed = 0.25, 
		life_time = 1800,
		hp = 10+enemy_level*2,
		dmg = 3
	}
end

