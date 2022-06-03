
beam_animation = 60
beam_colors = { 15,14,10,9 }

beam_flip = false

	y = 5
		x = 66



function fire_beam(self)
--	if (beam_animation > 30) beam_flip = playerflip
--
--	if (not beam_flip) then
--		x = 66
--	else 
--		x = -66
--	end
--
--	beam_animation -= 1
--	if (beam_animation > 45) then		
--		rectfill(playerx+4,playery+y, playerx+x,playery+y, 15)
--	elseif (beam_animation > 15) then		
--		rectfill(playerx+4,playery+y, playerx+x,playery+y, 7)
--	end
--	if (beam_animation > 10 and beam_animation < 35) then
--		rectfill(playerx+4,playery+y-1, playerx+x-1,playery+y-1, beam_colors[flr(rnd(4))+1])
--		rectfill(playerx+4,playery+y+1, playerx+x+1,playery+y+1, beam_colors[flr(rnd(4))+1])
--	end
--	if (beam_animation > 20 and beam_animation < 30)then
--		rectfill(playerx+4,playery+y-2, playerx+x-2,playery+y-2, beam_colors[flr(rnd(4))+1])
--		rectfill(playerx+4,playery+y+2, playerx+x+2,playery+y+2, beam_colors[flr(rnd(4))+1])
--	end
	if (beam_animation <= 0) then
		self.firing = false
		beam_animation = 60
	end

	if (beam_animation == 30) beam_damage_enemies()
	if (beam_animation == 15) beam_damage_enemies()
--	rectfill( topx,playery-2,bottomx,playery+8, 4)
end

function on_draw_beam()
--	if (beam_animation > 45) then		
--		rectfill(playerx+4,playery+y, playerx+x,playery+y, 15)
--	elseif (beam_animation > 15) then		
--		rectfill(playerx+4,playery+y, playerx+x,playery+y, 7)
--	end
--	if (beam_animation > 10 and beam_animation < 35) then
--		rectfill(playerx+4,playery+y-1, playerx+x-1,playery+y-1, beam_colors[flr(rnd(4))+1])
--		rectfill(playerx+4,playery+y+1, playerx+x+1,playery+y+1, beam_colors[flr(rnd(4))+1])
--	end
--	if (beam_animation > 20 and beam_animation < 30)then
--		rectfill(playerx+4,playery+y-2, playerx+x-2,playery+y-2, beam_colors[flr(rnd(4))+1])
--		rectfill(playerx+4,playery+y+2, playerx+x+2,playery+y+2, beam_colors[flr(rnd(4))+1])
--	end
end

function beam_damage_enemies()
--	topx = playerx+x
--	bottomx = playerx+x
--	if (beam_flip) then
--		topx = playerx+x
--		bottomx = playerx
--	else
--		topx = playerx
--		bottomx = playerx+x
--	end
--	for e in all(bugs) do
--		if is_point_in_rect(e.pos.x, e.pos.y, topx,playery-2,bottomx,playery+8) then
--			deal_damage(e, 35)
--			spr(125, e.pos.x,e.pos.y)
--		end
--	end
end