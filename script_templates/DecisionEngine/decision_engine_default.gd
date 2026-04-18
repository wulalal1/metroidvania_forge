#class_name DecisionEngineName
extends DecisionEngine

# meta_name: DecisionEngine
# meta-description: Boilerpalte decision engine script
# meta-default: true

# included in DecisionEngine
# var enemy: Enemy
# var current_state : EnemyState
# var blackboard : Blackboard

func _ready() -> void:
	await super()#super就是运行前先运行父节点的ready函数
	pass


func decide() -> EnemyState:
	#example decisions
	#if blackboard.damage_source:
		#if blackboard.health <= 0:
			#return es_death
		#else:
			#return es_stun 
	
	#if current_state is ESDeath or not  blackboard.can_decide:
		#return null
	#if blackboard.target:
		#if blackboard.distance_to_target < 40:
			#return attack_state?
		#return chase_state
	return null # default state
