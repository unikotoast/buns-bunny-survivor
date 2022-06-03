
map_tiles = {}

chunks_x = {}
chunks_y = {}

function map_setup()
	for i=-16, 16 do
		map_tiles[i] = {}
		for j=-16, 16 do 
		--	if (rnd(1) < .05) then
						random_tile(i,j)
		--	end
		end
	end
end

shake = 0
shaking = 0


function draw_map()
	mapx=flr(playerx/16)*16
	mapy=flr(playery/16)*16

	if (shake >0) shake -= 1

	if (shake > 0) then
		shaking = rnd(shake) - rnd(shake)
	else
		shaking = 0
	end

	camera((playerx)-64+shaking,(playery)-64+shaking)

	rectfill(playerx-64,playery-64, playerx+64,playery+64, 3)

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

function create_map_outside_x(xx)
	if (chunks_x[xx*playery/8] == nil) then
		chunks_x[xx*playery/8] = {}
		for i=flr(playery/8 -8), flr(playery/8 + 8) do
			random_tile(xx,i)
			map_tiles[xx-32] = nil
			map_tiles[xx+32] = nil
		end
	end

			chunks_x[(xx-32)*playery/8]= nil
			chunks_x[(xx+32)*playery/8]= nil
end

function create_map_outside_y(yy)
	if (chunks_y[yy*playerx/8] == nil) then
		chunks_y[yy*playerx/8] = {}
		for i=flr(playerx/8 -8), flr(playerx/8 + 8) do
			random_tile(i,yy)
			map_tiles[i][yy-32] = nil
			map_tiles[i][yy+32] = nil
		end
	end
			chunks_y[(yy-32)*playerx/8]= nil
			chunks_y[(yy+32)*playerx/8]= nil
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
