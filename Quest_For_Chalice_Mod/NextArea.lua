local NextArea = {
	extends = Area2D,
}

function NextArea:_ready()
	-- Correctly connect body_entered to the Collision method
	self:connect("body_entered", function(body) self:Collision(body) end)
end

function NextArea:_physics_process(delta)
end

-- collision code
function NextArea:Collision(body)
	if body:get_name() == "ModPlayer" then
		local intResult = math.random(1, 6);
		if intResult == 1 then
			-- loads mod room 1
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Quest_For_Chalice_Mod/foggy_lagoon.tscn")
			if scene_resource then
				local scene = scene_resource:instantiate()
				local root = self:get_tree():get_root()
				root:add_child(scene)

				local current = self:get_tree().current_scene
				if current then current:queue_free() end
			else
				print("Error: Failed to load scene!")
			end
		elseif intResult == 2 then
			-- loads mod room 2
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Quest_For_Chalice_Mod/bubble_island.tscn")
			if scene_resource then
				local scene = scene_resource:instantiate()
				local root = self:get_tree():get_root()
				root:add_child(scene)

				local current = self:get_tree().current_scene
				if current then current:queue_free() end
			else
				print("Error: Failed to load scene!")
			end
		elseif intResult == 3 then
			-- loads mod room 3
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Quest_For_Chalice_Mod/sunset_beach.tscn")
			if scene_resource then
				local scene = scene_resource:instantiate()
				local root = self:get_tree():get_root()
				root:add_child(scene)

				local current = self:get_tree().current_scene
				if current then current:queue_free() end
			else
				print("Error: Failed to load scene!")
			end
		elseif intResult == 4 then
			-- loads mod room 4
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Quest_For_Chalice_Mod/undersea_island.tscn")
			if scene_resource then
				local scene = scene_resource:instantiate()
				local root = self:get_tree():get_root()
				root:add_child(scene)

				local current = self:get_tree().current_scene
				if current then current:queue_free() end
			else
				print("Error: Failed to load scene!")
			end
		elseif intResult == 5 then
			-- loads mod room 5
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Quest_For_Chalice_Mod/moff.tscn")
			if scene_resource then
				local scene = scene_resource:instantiate()
				local root = self:get_tree():get_root()
				root:add_child(scene)

				local current = self:get_tree().current_scene
				if current then current:queue_free() end
			else
				print("Error: Failed to load scene!")
			end
		elseif intResult == 6 then
			-- loads mod room 6
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Quest_For_Chalice_Mod/ModRoom2.tscn")
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
end

return NextArea
