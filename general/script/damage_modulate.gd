class_name DamageModulate extends Node

@export var color : Color = Color(1.5,0.0,0.071,1.0)
var tween : Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if owner is Enemy:
		owner.was_hit.connect(_modulate_node)
	else:
		for c in owner.get_children():
			if c is DamageArea:
				c.damae_taken.connect(_modulate_node)
	pass # Replace with function body.

func _modulate_node( _a : AttackArea) -> void:
	if tween:
		tween.kill()
	owner.modulate = color
	tween = create_tween()
	tween.tween_property(owner,"modulate",Color.WHITE,0.5)
	pass
