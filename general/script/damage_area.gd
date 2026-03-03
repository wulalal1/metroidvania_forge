@icon("res://general/icons/damage_area.svg")
class_name DamageArea extends Area2D

signal damae_taken(attack_area)
@export var audio : AudioStream

func take_damage(attack_area : AttackArea) -> void:
	damae_taken.emit(attack_area)
	if audio:
		Audio.play_spatial_sound(audio,global_position)
	pass

func mke_invulnerable(duration: float = 1.0) -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	await get_tree().create_timer(duration).timeout
	process_mode = Node.PROCESS_MODE_INHERIT
	pass
