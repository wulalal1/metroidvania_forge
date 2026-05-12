class_name ESChase
extends EnemyState
#meta-name: EnemyState
#meta-description: Boilerplate template for enemy state script
#meta-default: true

# EnemyState class will inhert the following variable:
# @export var animation_name : string = "idle"
# var state_machine: EnemyStateMachine
# var enemy : Enemy
# var blackboard : Blackboard
@export var chase_speed : float = 100


func enter() -> void:
	enemy.play_animation(animation_name if animation_name else "chase")
	pass

func re_enter() -> void:
	pass

func exit() -> void:
	pass

func physics_update(_delta : float) -> void:
	var dir : float = sign(blackboard.target.global_position.x - enemy.global_position.x)
	enemy.change_dir(dir)
	enemy.velocity.x = dir * chase_speed
	pass
