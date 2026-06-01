class_name Coin extends Pickup

func on_pick_up(_p : Player) -> void:
	_p.gold += 1
	
	pass
