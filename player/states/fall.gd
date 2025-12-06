class_name PlayerStateFall extends PlayerState

func init() -> void:
	pass

#当我们进入这个状态会发生什么?
func enter() -> void:
	#play animation
	pass

#当我们退出这个状态时会发生什么?
func exit() -> void:
	pass

#当按下按键处理情况会发生什么?
func handle_input( _event : InputEvent) -> PlayerState:
	#handle input
	return next_state
	
	
func process(_delta: float) -> PlayerState:
	return next_state

func physics_process(_delta: float) -> PlayerState:
	if player.is_on_floor():
		player.add_debug_indicator()
		return idle
	player.velocity.x = player.direction.x * player.move_speed
	
	return next_state
