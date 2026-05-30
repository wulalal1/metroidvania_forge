class_name DecisionEngineFlying
extends DecisionEngine

# meta_name: DecisionEngine

# included in DecisionEngine
# var enemy: Enemy
# var current_state : EnemyState
# var blackboard : Blackboard

@export var attack_state: EnemyState
@export var idle_state: EnemyState
@export var chase_state: EnemyState
@export var move_state : EnemyState
@export var death_state : EnemyState
@export var stun_state : EnemyState

func _ready() -> void:
	await super()
	pass


func decide() -> EnemyState:
	#example decisions
	if blackboard.damage_source:
		if blackboard.health <= 0:
			return death_state
		else:
			return stun_state 
	
	if current_state is ESDeath or not  blackboard.can_decide:
		return null
	if blackboard.target:
		if attack_state.can_attack():
			return attack_state
		return chase_state
	return move_state # default state
