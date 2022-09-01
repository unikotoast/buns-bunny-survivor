starting_time = 120
starting = false

function start_setup()
	start = true
	add(bugs, skull())
end

function start_game()
	music(6)
	starting = true
end

function draw_manual()

	local ay = -120 + starting_time
	
	?"❎ x \f7shoot",-62,6+ay,14
	?"🅾️ z \f7dash",-62,14+ay,14
	
	
	?"\f0\#7start",-6,44+ay,6
	
	?"⬆️",44,2+ay,14
	?"⬅️⬇️➡️",36,8+ay,14
	?"move",40,16+ay,7



    --  for i=0,31/32,1/32 do
	--	local x=0+cos(i+t()/8)*30
	--	local y=-40+sin(i+t()/8)*4+ay
	--	local w=16+cos(i*1+t()/2)*4
	--	local h=12+sin(i*2+t()/2)*6
--
	--	--fillp(pattern[i*32])
	--	ovalfill(x-w,y-h,x+w,y+h, 0)
	--	-- (i*32)%8+8)
--
	--end

?"bunny survivor",-26,-36+ay,14
?"BY unikotoast\n1.9",-64, 48+ay,6
    -- pset(-26,-40+ay,8)
    -- pset(-28,-40+ay,8)

    -- pset(26,-44+ay,8)
    -- pset(28,-44+ay,8)




	for i=1,3 do
		?"\^t\^w\^t\^wbuns",-12+(i+1)%3,-48+sin(t()+i/3)+ay,({12,14,7})[i]
	end --flip()
       -- sspr(105, 64, 19, 6, -32, -48, 57, 18, false, false)

      --  add_particle(rnd(128)-64,-48,8,60)



	if (starting) then
		map_size += 8
		starting_time -= 1
		starting_time *= .90
	end
	if (starting_time <= 0) then
		start = false
		setup_enemy_waves()
	end
end

function skull()
	return {
		sprite = 12,
		death_sprite = 244,
		speed = 0, 
		hp = 30,
		aoe = 6,
		skull = true,
		death_item = start_game,
		life_time = 9999,
		no_teleport = true,
		pos = {x=0, y=34}
	}
end

--pattern={[0]=
--…,∧,░,⧗,▤,✽,★,✽,
--ˇ,░,▤,♪,░,✽,★,☉,
--░,▤,♪,░,✽,★,☉,…,
--∧,░,⧗,▤,✽,★,✽,★
--}