particles = {}
death_animations = {}

--frame_animations = {}

death_animations = {}

animations = {}

texts = {}

circles = {}

explosions = {}

--function add_frames_animation(x,y,dur,sprite, flip)
--	add(frame_animations,{x=x,y=y,duration=dur,timer=dur,sprite=sprite,is_flip = flip })
--end

--function animate_frames()
--	for f in all(frame_animations) do
--		f.timer -=1
--		if (f.timer>0) then spr(f.sprite, f.x,f.y, 1, 1, f.is_flip)
--		elseif (f.timer==0) then del(frame_animations, f)
--		end
--	end
--end

function add_anim(sprite, x, y, interval, frames)
	local anim = {sprite = sprite, x = x, y =y, step = 0, interval = interval, frame = 0, frames = frames, timer = false}
	add(animations, anim)
	return anim
end

function add_timed_anim(sprite, x, y, frames, timer, flip)
	add(animations, {sprite = sprite, x = x, y =y, step = 0, interval = timer / frames, frame = 0, frames = frames, timer = timer, flip = flip})
end

function animate_animations()
	for k, a in pairs(animations) do

		if (a.timer) then
			if (a.timer > 0) then
				a.timer -=1
			elseif (a.timer<=0) then 
				del(animations, a)
				a = nil
			end
		end

		if (a) then
			if (a.sprite) then
				spr(a.sprite + a.frame, a.x, a.y, 1,1,a.flip, false)
			end

			a.step += 1
			if (a.step % a.interval == 0) then
				if (a.frame == a.frames - 1) then
					a.frame = 0
				else
					a.frame += 1
				end
				a.step = 0
			end
		end

	end
end

function add_particle(x,y,color,time)
	add(particles, {x=x,y=y,color=color,time=time, speed = 0.5, move=true,direction = 2})
end


function add_text(text, x,y,color)
	add(texts, {text = text,x=x,y=y,color=color, death=100})
end

function move_particles()
 	for b in all(particles) do
		b.y -= .5
	end
end

function draw_text()
	for t in all(texts) do
		t.death -= 1
		t.y-=.15
		print(t.text, t.x,t.y,t.color)
		if (t.death <= 0 ) del(texts, t)
	end
end

function add_explosion(x,y,size,s,enemy,lost)
	if (lost or enemy or (not enemy and carrot_splash > 2)) shake = s
	for i=0,16 do
				local p = random_outside_point()
		add(explosions, {x=x,y=y,hx=p.x,hy=p.y,time = size, black = enemy, lost = lost})
	end
end

function draw_particles()
	for k, p in pairs(explosions) do
          local a = angle_move(p.x, p.y, p.hx, p.hy, 1.5)
          p.x+=a.x+.5-rnd(1)
          p.y+=a.y+.5-rnd(1)

          local clr = rnd({9,9,10})
          if (p.black) then
			clr = rnd({8,9,5})
         	if (p.time <=8) clr = 6
          end
          if (p.lost) then
         	clr = rnd({14,7,10})
          end

		circfill(p.x,p.y,max(0,p.time/2),clr)

		p.time -=1
		if (p.time == 0) del(explosions,p)

	end
	for k, p in pairs(particles) do
		pset(p.x,p.y,p.color)
		p.time -=1
		if (p.time == 0) del(particles,p)
	end
end


