
function bats_wave(start_time, num, interval, circle, swarm)
	local speed = .15
	if (swarm) speed = .75
	return make_wave(
		function() return {
		sprite = 9,
			death_sprite = 70,
			speed = speed, 
			hp = 15,
			draw_black = true
	}  end,
		start_time,
		interval,
		num,
		circle,
		swarm
	)
end

function eye_wave(start_time, num, interval)
	return make_wave(
		function() return {
		sprite = 14,
			death_sprite = 173,
			speed = .1+rnd(.25), 
			hp = 15+enemy_level
	}  end,
		start_time,
		interval,
		num
	)
end

function skeletons_wave(start_time, num, interval, circle)
	return make_wave(
		function() return {
		sprite = 25,
		death_sprite = 86,
		speed = 0.20, 
		hp = 25+enemy_level*2
	}  end,
		start_time,
		interval,
		num,
		circle
	)
end

function crystal_wave(start_time, num,type)
	local spr = 254
	local item = make_gems
	if (type == 1) then
		spr = 252
		item = make_peach
	elseif (type == 2) then
		spr = 220
		item = make_magnet
	end
	return make_wave(
		function() return {
		sprite = spr,
		death_sprite = 173,
		speed = 0.2, 
		hp = 100+enemy_level*20,
		gems = 11,
		is_crystal = true,
		death_item = item
	}  end,
		start_time,
		0,
		num
	)
end

function spirit_wave()
	return {
		sprite = 30,
		death_sprite = 199,
		speed = .3, 
		hp = 10,
		dmg = 2,
		life_time = 600
	}
end


function lich_wave(start_time, num)
	return make_wave(
		function() return {
		sprite = 46,
		death_sprite = 210,
		speed = 0.10, 
		hp = 50, 
		timer = 0,
		interval = 20,
		can_attack = true,
		attack = lich_attack_ice,
		spawn_count = 9,
		spawn = spirit_wave
	} end,
		start_time,
		0,
		num
	)
end
 
function demon_wave(start_time)
	return make_wave(
		function() return {
		sprite = -1,
		death_sprite = 244,
		speed = 0.1, 
		hp = 1900, 
		sx = 64,
		sy = 64,
		sw = 19,
		sh = 17,
		next_sx = 19,
		red_attack = true,
		can_attack = true,
		timer = 0,
		life_time = 9000,
		interval = 10,
		death_item = win_game,
		attack = lich_attack_ice,
	} end,
		start_time,
		0,
		1
	)
end