class_name PlayerStateRun extends PlayerState



func init() -> void:
	pass

#当我们进入这个状态会发生什么?
func enter() -> void:
	pass

#当我们退出这个状态时会发生什么?
func exit() -> void:
	pass

#当按下按键处理情况会发生什么?
func handle_input( _event : InputEvent) -> PlayerState:
	if _event.is_action_pressed("jump"):
		return jump

	return next_state
	
	
func process(_delta: float) -> PlayerState:
	if player.direction.x == 0.0:
		return idle
	return next_state

func physics_process(_delta: float) -> PlayerState:
	player.velocity.x = player.direction.x * player.move_speed
	if player.is_on_floor() == false:
		return fall
	return next_state
