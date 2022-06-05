enemy_waves = {}
enemy_level = 0

function setup_enemy_waves()
	random_waves()
end

function random_waves()
	bats_wave(0, 1)
	bats_wave(0, 50, 2)
	for i = 0,4 do
		chick_wave(15+15*i, i)
	end
	for j = 0,3 do
		for i = 0,3+j do
			bats_wave(200+i*5+j*100, 10, 0,false,true)
		end
	end
	lich_wave(150,1)
	bats_wave(180, 40, 0,true)
	lich_wave(260,2)
	skeletons_wave(300, 12, 0, true)
	for i = 0,12 do
		lich_wave(380+i*5, 1)
	end
	skeletons_wave(460, 20, 0, true)
	for i = 0,5 do
		bats_wave(580, 7, 0,false,true)
	end
	for i = 0,30 do
		bats_wave(590+i*7, 5+i*2, 0,false,true)
	end
	demon_wave(590)
	
	wave_chickens = function (time)
		chick_wave(time,15+enemy_level*4,1)
		chick_wave(time+15,enemy_level*4,1)
		if (enemy_level > 8) chick_wave(time+15,enemy_level*2,.5)
	end
	
	wave_jellies = function (time)
		jellies_acid_wave(time, 20+enemy_level*3, 1)
	end
	
	wave_shrooms = function (time)
		mushroom_wave(time, 10+enemy_level*4, 1)
	end
	
	wave_bats_circle = function (time)
		for i=0,2+enemy_level/4 do
			bats_wave(time+i*7, 12, 0,true)
		end
		if (enemy_level > 8) crystal_wave(time, flr(enemy_level/2))
	end
	
	wave_bats = function (time)
		bats_wave(time,30+enemy_level*4,1)
		if (enemy_level > 6) bats_wave(time+15,enemy_level*3,.3)
	end

	wave_skeletons = function (time)
		skeletons_wave(time,20+enemy_level*3,1.5)
	end

local t = 0
	for i=2,19 do
		t += .5*i
		bunny(i*50+rnd(25))
		crystal_wave((i-1)*60+rnd(30),1)
		bats_wave(i*60+rnd(60), 10, 0,false,true)

		local bombs = 1
		if (i > 7) bombs = 2
		bomb_wave(i*60+rnd(30),bombs)

		local wave = rnd({wave_chickens, wave_jellies, wave_shrooms, wave_bats_circle,wave_bats,wave_skeletons})
		if (i < 12 or i > 13) then
		--	log("wave "..i.." : "..(i*35 - t))
			wave(i*35-t)
		end
	end
end


function make_wave(create_unit, start_time, interval, count, circle, is_swarm)
	add(enemy_waves, {
		timer = 0,
		create_unit = create_unit,
		start_time = start_time,
		interval = (interval or 0)*60,
		count = count,
		total_count = count,
		is_swarm = is_swarm,
		is_wall = circle
	})
end
