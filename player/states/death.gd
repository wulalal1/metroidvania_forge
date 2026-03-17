class_name PlayerStateDeath extends PlayerState

const DEATH_AUDIO = preload("uid://dea8hwwsiswo2")



#当我们进入这个状态会发生什么?
func enter() -> void:
	#play animation
	player.animation_player.play("death")
	Audio.play_spatial_sound(DEATH_AUDIO,player.global_position)
	Audio.play_music(null)
	await player.animation_player.animation_finished
	PlayerHud.show_game_over()
	pass

#当我们退出这个状态时会发生什么?
func exit() -> void:
	pass

#当按下按键处理情况会发生什么?
func handle_input( _event : InputEvent) -> PlayerState:
	#handle input
	
	return null
	
	
func process(_delta: float) -> PlayerState:
	
	return null

func physics_process(_delta: float) -> PlayerState:
	player.velocity.x = 0

	return null
