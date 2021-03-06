player_animation = 0
sprite_x = 0

playerx=0
playery=0
playerhp=3
playerhp_max=3
p_energy = 3
p_energy_max = 3
playerang = .75
player_damaged = 0
beam_animation= .1

hair_color= 14
player_damaged_dash = false

function damage_player(dmg)
	if (dmg and dmg > 0 and player_damaged == 0) then
		sfx(0)
		player_damaged = 80
		playerhp -= 1
		shake = 8
		if (playerhp <= 0) game_lost()
	end
end


function pink_line(i,clr)
	line(playerx+2+i,playery+2, playerx+2+i,playery-65, rnd({14,clr}))
end

function draw_player()
if ( game_over and not game_won) then
	return
end
	if (player_damaged == 0) then
		player_damaged_dash = false
	end
	local p_sprite = 40
	if (show_lvlup) then

		if (beam_animation < 7) then
				beam_animation *=1.2
			else
				beam_animation = 7
			end
			local clr = 14
			local clry = 14
			if (rnd()<0.15) clr = 15
			if (rnd()<0.15) clry = 15
				for i=0,beam_animation do 
					pink_line(i,clr)
					pink_line(-i,clry)
				end

			for i = 1,3 do 
				local xx = i
				if (i==1) then
					for i = 0,15 do 
						pal(i, 8) 
					end
				end
				if (i==2) then
				 	xx = 3
					for i = 0,15 do 
						pal(i, 12) 
					end
				end
				if (i==3) then
				 	xx = 2
					pal() 
				end
				sspr(111,96,18, 11, playerx-4-xx,playery+sin(t()+i/3), 18, 11, playerflip)
			end
			return
	end

	if (player_damaged  > 1) then

		for i = 0,15 do 
			if (player_damaged_dash) then
				pal(i, rnd({15,7}))
			else
				pal(i, rnd({8,14}))
			end
			
		end
	end

	if (playerang == .25) then
		p_sprite = 84
	elseif (playerang == .75) then
		p_sprite = 106
		
	end
						pal(14, hair_color) 
	if (dash_cooldown < dash_cooldown_max - dash_cooldown_max/5 ) then
		if (playerang == .25) then
			p_sprite = 95
		elseif (playerang == .75) then
			p_sprite = 62
		else
			p_sprite = 51
		end

	elseif(dash_cooldown < dash_cooldown_max) then
		if (playerang == .25) then
			p_sprite = 117
		elseif (playerang == .75) then
			p_sprite = 106
		else
			p_sprite = 73
		end
	end
	if (is_moving) then		
		sspr(sprite_x,p_sprite,9, 11, playerx,playery, 9, 11, playerflip)
		player_animation+=1
		if (player_animation<6) then 
			sprite_x = 8
		elseif (player_animation<12) then 
			sprite_x = 17
		elseif (player_animation>12) then 
			player_animation = 0
		end
	else
		sspr(0,p_sprite,8, 11, playerx,playery, 8, 11, playerflip)
	end
			pal() 
	if (player_damaged > 0) then
		player_damaged -= 1
		if (player_damaged <= 0) then
			player_damaged = 0
		end
	end

	--end
end




 obj = {x=0,y=0}
    facing = 1

function setup_hair()
    obj.hair={}
    for i=0,4 do
        add(obj.hair,{x=0,y=0,size=max(1,min(2,3-i))})
    end
end

draw_hair=function(obj,facing)
	if (dash_cooldown < dash_cooldown_max) dash_no_energy = true
	if (dash_cooldown_max > dash_cooldown_max and dash_no_energy) then
	--	sfx(9)
		dash_no_energy = false
	end
	if (show_lvlup) then

	else
    	local last={x=obj.x+2-facing,y=obj.y+3}
    	local clr = 14
    	for i=1,5 do
    		if (player_damaged_dash or dash_cooldown  <   (dash_cooldown_max - ((dash_cooldown_max /6)*i) )) then
    			clr = 7
    		else
    			clr = hair_color
    		end

    			local h =obj.hair[i]
    	    h.x+=(last.x-h.x)/2
    	    h.y+=(last.y-h.y)/2
    	    circfill(h.x,h.y,h.size,clr)
    	    last=h
    	end
	end
end