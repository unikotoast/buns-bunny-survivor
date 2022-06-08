

--function skull_wave(start_time)
--	return make_wave(
--		function() return {
--		sprite = 11,
--		death_sprite = 86,
--		speed = 0, 
--		hp = 10,
--		life_time = 11560,
--		can_attack = false,
--		timer = 0,
--		interval = 60,
--		attack = skull_attack,
--		pos = {x=x, y=y},
--		dmg = 1
--	} end,
--		start_time,
--		1,
--		1
--	)
--end
function bats_wave(start_time, num, interval, circle, swarm)
	local speed = .15
	if (swarm) speed = .9
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

--function eye_wave(start_time, num, interval, shine)
--	return make_wave(
--		function() return {
--		sprite = 14,
--		death_sprite = 173,
--		speed = 0.10+(rnd(.25)), 
--		hp = 25,
--		dmg = .5,
--		can_shine = shine
--	}  end,
--		start_time,
--		interval,
--		num
--	)
--end

--function bat()
--	return {
--			sprite = 9,
--			death_sprite = 70,
--			speed = .2, 
--			hp = 20,
--			draw_black = true,
--			dmg = 1
--		} 
--end
--
--function bats_wave(start_time, num, interval, is_swarm, speed)
--	return make_wave(
--		{
--			sprite = 9,
--			death_sprite = 70,
--			speed = .2, 
--			hp = 20,
--			draw_black = true,
--			dmg = 1
--		} ,
--		start_time,
--		interval,
--		num,
--		false,
--		is_swarm
--	)
--end

--function bats_circle(start_time)
--	return make_wave(
--		function() return bat()
--		 end,
--		start_time,
--		0,
--		30,
--		true,
--		false
--	)
--end

--function skeletons_wall(start_time)
--	return make_wave(
--		function() return {
--		sprite = 25,
--		death_sprite = 86,
--		speed = 0.12, 
--		hp = 40,
--		dmg = 1
--	}  end,
--		start_time,
--		0,
--		20,
--		true
--	)
--end
--
function skeletons_wave(start_time, num, interval, circle)
	return make_wave(
		function() return {
		sprite = 25,
		death_sprite = 86,
		speed = 0.20, 
		hp = 10+enemy_level*5
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
		hp = 75+enemy_level*20,
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
		hp = 55+enemy_level*2, 
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
-- 
--function bomb_wave(start_time)
--	return make_wave(
--		function() return {
--		sprite = 41,
--		death_sprite = 37,
--		speed = .5, 
--		hp = 30,
--		particle = 10,
--		dmg = 1
--	}  end,
--		start_time,
--		1,
--		1
--	)
--end
