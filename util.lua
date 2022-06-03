function aoe_damage(x,y,radius,dmg,dmg_player)
	if (dmg_player and dst(x,y,playerx,playery) < radius) damage_player(35)

	for e in all(bugs) do
		if (not e.exploded and dst(x,y,e.pos.x,e.pos.y) < radius) deal_damage(e, dmg)
	end
end

--function is_point_in_rect(x,y,x1,y1,x2,y2)
--	return x > x1 and x < x2 and y > y1 and y < y2
--end

function random_outside_point(angle, radius, centerx, centery)
	a=angle or rnd()
	r=radius or 90
	return {x=r*cos(a)+(centerx or playerx),y=r*sin(a)+(centery or playery)}
end

function rnd_bln()
	return rnd({true,false})
end

function angle_move(x,y, targetx, targety, speed)
          local a=atan2(x-targetx,y-targety)
          return {x=-speed*cos(a), y=-speed*sin(a)}
end


function log(text)
	printh(text)
end


--function dst2(x1,y1,x2,y2)
--	log(""..x2..":"..y2)
--	local l = sqr(x1-x2)+sqr(y1-y2)
--	local l2 = sqrt(sqr(x1-x2)+sqr(y1-y2))
--	log(""..l.."  "..l2)
-- return l2
--end
--
--function sqr(x) return x*x end

function text_bg(t,...) 
	?"\^i"..t.."\^-i\^g\f0"..t,...
end

function dst(x1,y1,x2,y2)
 local x,y=abs(x2-x1),abs(y2-y1)
 if x<y then x,y=y,x end -- accuracy goes down massively if x is much smaller than y so swap them :)
 return x/sin(atan2(y,x))
end

--function dst(x,y,x2,y2)
-- --gets the distance between
-- --two points. faster than
-- --the previous version.
-- local dx, dy = x - x2, y - y2
-- return squaredist(dx,dy)
--end
--
--function squaredist(dx,dy)
-- local sdx,sdy=shr(dx,8),shr(dy,8)
-- return shl(min(0x0.7fff,sdx*sdx+sdy*sdy),16)
--end



--function text_outline(s,...)
--	for i in all(split'\-f\f0,\-h\f0,\|f\f0,\|h\f0') do
--		?i..s,...
--	end
--	?s,...
--end