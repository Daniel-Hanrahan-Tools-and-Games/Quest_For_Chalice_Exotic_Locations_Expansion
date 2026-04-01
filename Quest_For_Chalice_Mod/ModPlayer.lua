local ModPlayer = {
	extends = CharacterBody2D,
	
	-- Physics variables
	dblSpeed = 200,
	dblJumpVelocity = -500,
	dblGravity = 500,
	
	-- Runtime state
	velocity = Vector2.ZERO,
	intMoveLock = 0,
}

function ModPlayer:_ready()
	-- Initialization logic here if needed
end

function ModPlayer:_physics_process(delta)
	-- initializes animation
	local sprite = self:get_node("AnimatedSprite2D")

	-- Gravity
	if not self:is_on_floor() then
		self.velocity = Vector2(self.velocity.x, self.velocity.y + self.dblGravity * delta)
	else
		self.velocity = Vector2(self.velocity.x, 0)
		self.intMoveLock = 0
	end

	-- Horizontal Movement
	if Input:is_action_pressed("Right") then
		if self.intMoveLock ~= 1 then
			self.velocity = Vector2(self.dblSpeed, self.velocity.y)
			sprite.flip_h = false
			sprite:play("default")
		end
	elseif Input:is_action_pressed("Left") then
		if self.intMoveLock ~= 1 then
			self.velocity = Vector2(-self.dblSpeed, self.velocity.y)
			sprite.flip_h = true
			sprite:play("default")
		end
	else
		if self.intMoveLock ~= 1 then
			self.velocity = Vector2(0, self.velocity.y)
			sprite:stop()
		end
	end

	-- Jump
	if self:is_on_floor() and Input:is_action_just_pressed("Jump") then
		self.velocity = Vector2(self.velocity.x, self.dblJumpVelocity)
		sprite:stop()
		self.intMoveLock = 1
	end

	-- Move player
	self:move_and_slide()
	
end

return ModPlayer
