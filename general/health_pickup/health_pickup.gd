class_name HealthPickup extends Pickup

@export var heal_amount : float = 10.0



func on_pick_up(player: Player) -> void:
	player.hp += heal_amount
	pass
