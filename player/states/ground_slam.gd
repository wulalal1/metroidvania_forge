class_name PlayerStateGroundSlam extends PlayerState
const DASH_AUDIO = preload("uid://8mnv3h3fu4tv")
const BOOM_AUDIO = preload("uid://dab57ps0mfeu")

@onready var damage_area: DamageArea = %DamageArea
@onready var ground_slam_attack_area: AttackArea = %GroundSlamAttackArea
@onready var ground_slam_shape_cast: ShapeCast2D = $"../../GroundSlamShapeCast"
const HIT_BARREL_YELLOW = preload("uid://cxtqm33ptt46a")
const HIT_MAGIC_BLUE = preload("uid://cq0xhf71a3nxb")
const HIT_WOOD_LARGE = preload("uid://cdhsp4kmsm4ht")
const HIT_WOOD_MEDIUM = preload("uid://dvto1g1fvd75o")
const HIT_WOOD_SMALL = preload("uid://by4yj45mta71j")
const BREAK_WOOD_AUDIO = preload("uid://dlv8bmratvyv5")

@export var velocity : float = 400
@export var effect_delay : float = 0.075
var effect_timer : float = 0

func init() -> void:
	pass

#当我们进入这个状态会发生什么?
func enter() -> void:
	#play animation
	player.animation_player.play("ground_slam")
	player.sprite.tween_color()
	Audio.play_spatial_sound(DASH_AUDIO,player.global_position)
	damage_area.start_invulnerable()
	ground_slam_attack_area.set_active()
	pass

#当我们退出这个状态时会发生什么?
func exit() -> void:
	VisualEffects.camera_shake(10.0)
	VisualEffects.land_dust(player.global_position)
	VisualEffects.hit_dust(player.global_position)
	Audio.play_spatial_sound(BOOM_AUDIO,player.global_position)
	damage_area.end_invulnerable()
	ground_slam_attack_area.set_active(false)
	pass

#当按下按键处理情况会发生什么?
func handle_input( _event : InputEvent) -> PlayerState:
	#handle input
	return null
	
	
func process(_delta: float) -> PlayerState:
	check_collisions(_delta)
	effect_timer -= _delta
	if effect_timer < 0:
		effect_timer = effect_delay
		player.sprite.ghost()
	return null

func physics_process(_delta: float) -> PlayerState:
	player.velocity = Vector2(0,velocity)
	if player.is_on_floor():
		if not check_collisions(_delta):
			return idle
	return null
func check_collisions(_delta : float) -> bool:
	ground_slam_shape_cast.target_position.y = velocity * _delta
	ground_slam_shape_cast.force_shapecast_update()
	if ground_slam_shape_cast.is_colliding():
		for i in ground_slam_shape_cast.get_collision_count():
			var c = ground_slam_shape_cast.get_collider(i)
			var pos : Vector2 = ground_slam_shape_cast.get_collision_point(i)
			VisualEffects.hit_dust(pos)
			VisualEffects.camera_shake(10.0)
			if c.get_parent() is Breakable:
				var b : Breakable = c.get_parent()
				b.queue_free()
				Audio.play_spatial_sound(b.destory_audio,pos)
				for p in b.destory_particles:
					VisualEffects.hit_particles(pos,Vector2.DOWN,p)
			else:
				c.queue_free()
				VisualEffects.hit_particles(pos,Vector2.DOWN,HIT_WOOD_MEDIUM)
				VisualEffects.hit_particles(pos,Vector2.DOWN,HIT_WOOD_LARGE)
				VisualEffects.hit_particles(pos,Vector2.UP,HIT_WOOD_SMALL)
				Audio.play_spatial_sound(BREAK_WOOD_AUDIO,pos)
			
		return true
	return false
