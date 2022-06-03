-- source: https://www.lexaloffle.com/bbs/?tid=29466
-- ~400 tokens

_9 = {}
function point(x,y) return {x=x,y=y} end
for x=-1,1 do for y=-1,1 do add(_9,point(x,y)) end end
--function p_str(p) return p.x+128*p.y end
function p_str(p) return p.x..","..p.y end
function xy_str(x,y) return x..","..y end
function coords(p, s) return point(flr(p.x*(1/s)),flr(p.y*(1/s))) end


function badd(k,e,_b)
	_b[k] = _b[k] or {} 
	add(_b[k], e)
end

function bdell(k,e,_b)
	_b[k] = _b[k] or {} 
	del(_b[k], e)
end

function bstore(_b,e)
	local p = p_str(coords(e[_b.prop],_b.size))
	local k = e._k
	if k then
		if (k != p) then
			local b = _b[k]
			del(b,e)
			if (#b == 0) _b[k]=nil
			badd(p,e,_b)
		end
	else badd(p,e,_b) end
	e._k = p
end

function bclear(_b,e)
	local p = p_str(coords(e[_b.prop],_b.size))
	local k = e._k
	if k then
	if (k != p) then
		local b = _b[k]
		del(b,e)
		if (#b == 0) _b[k]=nil
			bdell(p,e,_b)
		end
	else bdell(p,e,_b) end
	e._k = p
end

function bget(_b, p)
	local p = coords(p, _b.size)
	local _ = {}
	for o in all(_9) do
		local found = _b[p_str(point(p.x+o.x,p.y+o.y))]
		if found then for e in all(found) do add(_,e) end end
	end
	return _
end

-- usage
-- create a data 'store' {size=30,prop="pos"}
-- store.prop should match your entities' position property name, 
-- which should be a 'point' value like {x=0,y=0}
-- store.size should be tuned to the max neighbor distance you'll be finding

-- periodically call bstore(store, entity) to update their bucket membership

-- bget(store, point) returns stored entities from a 3x3 square of buckets around 
-- the given point, filter these by a distance function if you need more precision

-- remember you can maintain multiple stores based on the needs of your game!


-- demo

bugstore = {size=3,prop="pos"}
cam = point(0,0)



function bump_move(me)
	if (me.no_collision) then
		return
	end
	for e in all(bget(bugstore,me.pos)) do
		if (e != me) then
			if rnd(1) < 0.5 then
			--	me.pos.x += sgn(me.pos.x-e.pos.x)*1
				e.pos.x -= sgn(me.pos.x-e.pos.x)*1
			else
			--	me.pos.y += sgn(me.pos.y-e.pos.y)*1
				e.pos.y -= sgn(me.pos.y-e.pos.y)*1
			end
-- pline(me.pos,e.pos, 5)
		end
	end
end



function store_enemies()
	for e in all(bugs) do
		if (e.no_collision) then
			return
		end
		bstore(bugstore, e)
	end
end


