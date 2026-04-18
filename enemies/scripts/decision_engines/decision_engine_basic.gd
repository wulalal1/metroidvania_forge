class_name DecisionEngineBasic
extends DecisionEngine

# meta_name: DecisionEngine

# included in DecisionEngine
# var enemy: Enemy
# var current_state : EnemyState
# var blackboard : Blackboard
@onready var es_walk: ESWalk = %ESWalk
@onready var es_stun: ESStun = %ESStun
@onready var es_death: ESDeath = %ESDeath



func _ready() -> void:
	await super()#super就是运行前先运行父节点的ready函数
	pass


func decide() -> EnemyState:
	#example decisions
	if blackboard.damage_source:
		if blackboard.health <= 0:
			return es_death
		else:
			return es_stun 
	
	if current_state is ESDeath or not  blackboard.can_decide:
		return null
	
	if blackboard.edge_detected:
		enemy.change_dir(-blackboard.dir)
	return es_walk # default state
