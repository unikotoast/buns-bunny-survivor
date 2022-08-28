magnet_effect = false
magnet_timer = 0
magnet_speed = 3

function draw_magnet_effect()
	magnet_speed = magnet_speed *0.9 + 0.03
	magnet_timer += magnet_speed 
	--circ(playerx, playery, magnet_timer*2, 7)
	circ(playerx-1, playery+rnd(3), magnet_timer*2, 12)
	circ(playerx+1, playery+rnd(3), magnet_timer*2, 8)
	if (magnet_timer >= 48) then
		magnet_speed =3
		magnet_timer = 0
		magnet_effect = false
	end
end

		