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
				spr(a.sprite + a.frame, a.x, a.y, 1,1,a.flip)
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

function add_particle(x,y,color,time,move)
	add(particles, {x=x,y=y,color=color,time=time, speed = 0.5, move=move or .5})
end


function add_text(text, x,y,color)
	add(texts, {text = text,x=x,y=y,color=color, death=100})
end

function move_particles()
 	for b in all(particles) do
 		b.y -= b.move
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

function add_explosion(x,y,size,s,enemy,lost,frost,lightning)
	if (lost or enemy or (not enemy and carrot_splash > 2)) shake = s
	local count = 14
	if (frost) count = 40
	for i=0,count do
				local p = random_outside_point()
				local p1 = random_outside_point(rnd(),rnd(size),x,y)
		add(explosions, {x=p1.x,y=p1.y,hx=p.x,hy=p.y,time = lightning or size, black = enemy, lost = lost,frost = frost, is_light = lightning})
	end
end

function draw_particles()
	for k, p in pairs(explosions) do
		local speed = .2
		if (p.frost) speed = .1
        local a = angle_move(p.x, p.y, p.hx, p.hy, speed)
        p.x+=a.x+.5-rnd(1)
        p.y+=a.y+.5-rnd(1)

        local clr = rnd({8,9,10})
		if (p.frost) clr = rnd({12,12,7})

        if (p.black) then
			clr = rnd({8,9,5})
        	if (p.time <=8) clr = 6
        end
        if (p.lost) then
        	clr = rnd({14,7,10})
        end

        local radius = p.time/2
        if (p.frost) radius = rnd(2)
        if (p.is_light) radius = 0
		--circfill(p.x,p.y,rnd(2),clr)
		circfill(p.x,p.y,max(0,radius),clr)

		p.time *=.9
		p.time -=.01
		if (p.time <= 0) del(explosions,p)

	end
	for k, p in pairs(particles) do
		circfill(p.x,p.y,max(0,p.time/9),p.color)
	--	pset(p.x,p.y,p.color)
		p.time -=1
		if (p.time == 0) del(particles,p)
	end
end


