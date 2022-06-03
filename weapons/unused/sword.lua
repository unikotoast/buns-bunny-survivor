slash_animation = 8
slash_sprite = 8
slash_scale = 2
w_slash_energy = 35
slash_rounds = 1

w_slash = 		{enabled = true, lvl =0, cd = 0, interval = 60, dmg = 20, speed = 1, duration=15, sprite=64 }

function fire_slash()

	if (w_slash.cd == 0  and p_energy - w_slash_energy > 0) then
		sfx(1)
		energy_cd = 40
		w_slash.cd = max(40 - w_slash.lvl*5,10)
		p_energy -= w_slash_energy


	w_slash.x = playerx
	w_slash.y = playery -4

	slash_flip_y = false
	slash_flip_x = playerflip


	local x_position = 14
	local y_position = 0
	if (playerflip) x_position = -29

	local sy = 8
	local flipx = playerflip
	local flipy = rnd_bln()

	y1_damage_slash = -8
	y2_damage_slash = 16

	x1_damage_slash = 8
	x2_damage_slash = 40
	if (playerflip) then
		x1_damage_slash = -36
		x2_damage_slash = 0
	end



	if (playerdir == 8) then 
		x_position = -8
		sy = 16
		flipx = rnd_bln()
		flipy = false
		y_position = -16

		x1_damage_slash = - 8
		x2_damage_slash =  16
		y1_damage_slash = - 28
		y2_damage_slash =  5
	end

	if (playerdir == 2) then 
		x_position = -8
		sy = 16
		flipx = rnd_bln()
		flipy = true
		y_position = 20

		x1_damage_slash = - 8
		x2_damage_slash =  16
		y1_damage_slash = 4
		y2_damage_slash = 38
	end

	if (flr(rnd(2)) == 0) slash_sprite = 8

	if (flr(rnd(2)) == 0) slash_flip_y = true


	dd(animations, {x = w_slash.x+ x_position, y =w_slash.y +y_position, 
		sx = 96, sy = sy, sw = 8, sh = 8, next_sx = 8, step = 0, 
		interval = 3, 
	rame = 0, frames = 2, timer = 6, sizex = 3, sizey = 2,flipx = flipx,flipy = flipy})
	
	
		for e in all(bugs) do
			if is_point_in_rect(e.pos.x, e.pos.y,
				w_slash.x+x1_damage_slash, w_slash.y+y1_damage_slash,
				w_slash.x+x2_damage_slash, w_slash.y+y2_damage_slash) then
					deal_damage(e, 10 + w_slash.lvl*2)
			end
		end


		w_slash.firing = false


end
end



