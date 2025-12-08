class_name PlayerStateJump extends PlayerState

@export var jump_velocity : float = 450.0


func init() -> void:
	pass

#当我们进入这个状态会发生什么?
func enter() -> void:
	#play animation
	player.animation_player.play("jump")
	player.animation_player.pause()
	#player.add_debug_indicator(Color.LIME_GREEN)
	player.velocity.y = -jump_velocity
	
	#check if this is a buffer jump
	if player.previous_state == fall and not Input.is_action_pressed("jump"):
		await get_tree().physics_frame
		player.velocity.y *= 0.5
		player.change_state(fall)
		pass
	pass

#当我们退出这个状态时会发生什么?
func exit() -> void:
	#player.add_debug_indicator(Color.YELLOW)
	pass

#当按下按键处理情况会发生什么?
func handle_input(event : InputEvent) -> PlayerState:
	#handle input
	if event.is_action_released("jump"):
		player.velocity.y *= 0.5
		return fall
	return next_state
	
	
func process(_delta: float) -> PlayerState:
	set_jump_frame()
	return next_state

func physics_process(_delta: float) -> PlayerState:
	if player.is_on_floor():
		return idle
	elif player.velocity.y >= 0.0:
		return fall
	player.velocity.x = player.direction.x * player.move_speed
	return next_state


func set_jump_frame() -> void:
	var frame : float = remap( player.velocity.y,-jump_velocity,0.0,0.0,0.5)
	player.animation_player.seek(frame,true)
	pass
	
