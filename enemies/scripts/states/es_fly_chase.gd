class_name ESFlyChase
extends EnemyState
#meta-name: EnemyState
#meta-description: Boilerplate template for enemy state script
#meta-default: true

# EnemyState class will inhert the following variable:
# @export var animation_name : string = "idle"
# var state_machine: EnemyStateMachine
# var enemy : Enemy
# var blackboard : Blackboard
@export var speed : float = 100

func enter() -> void:
	var anim : String = animation_name if animation_name else "chase"
	enemy.play_animation(anim)
	pass

func re_enter() -> void:
	pass

func exit() -> void:
	pass

func physics_update(_delta : float) -> void:
	if not is_instance_valid(blackboard.target):
		return
	var dir : Vector2 = enemy.global_position.direction_to(blackboard.target.global_position)
	enemy.change_dir(sign(dir.x))
	enemy.velocity = speed * dir
	pass
