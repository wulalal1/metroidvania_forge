class_name DoomScribeCurse extends Node2D
var damage : float = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var p : Node2D = get_tree().get_first_node_in_group("Player")
	#if p:
		#reparent(p)
	#else:
		#queue_free()
	$AnimationPlayer.animation_finished.connect(_on_animaition_finished)
	pass # Replace with function body.

func _enter_tree() -> void:
	await get_tree().process_frame
	var p : Node = get_tree().get_first_node_in_group("Player")
	reparent(p)
	self.position = Vector2(0,-48)
	pass

func damage_player() -> void:
	$AttackArea.activate()
	
	pass

func _on_animaition_finished(_a : String) -> void:
	queue_free()
	pass

func set_enemy(e : Enemy) -> void:
	e.was_killed.connect(_on_enemy_killed)
	pass

func _on_enemy_killed() -> void:
	queue_free()
	pass
