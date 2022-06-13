enemy_waves = {}
enemy_level = 0
wave_index = 4

function setup_enemy_waves()
	random_waves()
end

function random_waves()
	bats_wave(0, 70, 2)
	bunny(30)
	bats_wave(65, 35,.8)
	bats_wave(65, 6,0,false,true)
	crystal_wave(110,1, flr(rnd(2.6)))
	for i = 0,3 do
		chick_wave(15+15*i, i)
	end
	lich_wave(185,1)
	bats_wave(260, 40, 0,true)
	bomb_wave(300,6,4)
	crystal_wave(340, 10)

	--for j = 0,3 do
	--	for i = 0,3+j do
	--		bats_wave(200+i*5+j*100, 10, 0,false,true)
	--	end
	--end
	for i = 0,12 do
		lich_wave(380+i*5, 1)
	end
	skeletons_wave(460, 30, 0, true)
	for i = 0,5 do
		bats_wave(580, 7, 0,false,true)
	end
	for i = 0,30 do
		bats_wave(590+i*7, 5+i*2, 0,false,true)
	end
	demon_wave(590)
	
	wave_chickens = function (time)
		chick_wave(time,20+wave_index*2,1)
	end
	
	wave_jellies = function (time)
		jellies_acid_wave(time, 20+wave_index, 1)
	end
	
	wave_shrooms = function (time)
		mushroom_wave(time, 10+wave_index)
	end
	
	wave_bats_circle = function (time)
		for i=0,1 do
			bats_wave(time+i*8, 10+wave_index, 0,true)
			skeletons_wave(time+i*8,wave_index)
		end
	end

	wave_skeletons = function (time)
		skeletons_wave(time,30+wave_index*2,1.5)
	end

	wave_eye = function (time)
		eye_wave(time,20+wave_index*2,1)
	end

local t = 0
	for i=4,19 do
		t += .5*i
		wave_index += 1
		skull_wave(i*50+rnd(20))
		bunny(i*40+rnd(25))
		crystal_wave((i-1)*50+rnd(30),1, flr(rnd(2.6)))
		bats_wave(i*40+rnd(60), 10+i, 0,false,true)

		bomb_wave(i*60+rnd(30),1)

		local wave = rnd({wave_chickens, wave_jellies, wave_shrooms, wave_bats_circle,wave_skeletons,wave_eye})
		if (i < 12 or i > 13) then
			--log("wave "..i.." : "..(i*35 - t))
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
