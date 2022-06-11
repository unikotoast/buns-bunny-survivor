
map_tiles = {}

function map_setup()
	for i=-32, 32 do
		map_tiles[i] = {}
		for j=-32, 32 do 
			random_tile(i,j)
		end
	end
end

shake = 0
shaking = 0

map_size = 60


function draw_map()
	mapx=flr(playerx/32)*32
	mapy=flr(playery/32)*32

	if (shake >0) shake -= 1

	if (shake > 0) then
		shaking = rnd(shake) - rnd(shake)
	else
		shaking = 0
	end

	camera((playerx)-64+shaking,(playery)-64+shaking)

	if (start) then
		local p = random_outside_point(rnd(),map_size+4,0,0)
		add_particle(p.x,p.y, 0, 80,.1)
	end
	circfill(0,0,map_size,3)

	for i=flr(playerx/8 -8), flr(playerx/8 + 8) do
		for j=flr(playery/8 -8), flr(playery/8 +8) do 

			if (map_tiles[i]) then
				local tile = map_tiles[i][j]
				if (tile and tile.sprite<10) then
					spr(tile.sprite, i*8, j*8)
				end
			end

		end
	end
end

function random_tile(x,y)
	if (map_tiles[x]==nil) then
		map_tiles[x] = {}
	end
	
	if (map_tiles[x][y]==nil) then
		local r = rnd(100)
		if (r < 7) then
			map_tiles[x][y] = {sprite = flr(rnd(9)), x=x*8, y=y*8}
		else
			map_tiles[x][y] = {sprite = 10} 
		end
	end
end
