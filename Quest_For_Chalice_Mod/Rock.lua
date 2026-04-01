local Rock = {
	extends = Area2D,

	-- variables needed
	dblSpeed = -100.0,
	velocity = Vector2.ZERO,
	
	-- lua for some reason does not like respawning I had a debug line for it but it did not respawn
}

function Rock:_ready()
	-- initializes animation
	local sprite = self:get_node("AnimatedSprite2D")
	-- plays animation
	sprite:play("default")

	-- Correctly connect body_entered to the Collision method
	self:connect("body_entered", function(body) self:Collision(body) end)
end

function Rock:_physics_process(delta)
	-- has rock going left
	self.velocity = Vector2(self.dblSpeed, 0)
	self.position = self.position + self.velocity * delta
end

-- collision code
function Rock:Collision(body)
	if body:get_name() == "ModPlayer" then
		-- loads main menu
		local ResourceLoader = Engine:get_singleton("ResourceLoader")
		local scene_resource = ResourceLoader:load("res://MainMenu.tscn")
		if scene_resource then
			local scene = scene_resource:instantiate()
			local root = self:get_tree():get_root()
			root:add_child(scene)

			local current = self:get_tree().current_scene
			if current then current:queue_free() end
		else
			print("Error: Failed to load scene!")
		end
	end
end



return Rock
