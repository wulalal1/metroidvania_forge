@icon( "res://player/states/state.svg" )
class_name PlayerState extends Node

var player : Player
var next_state : PlayerState = null

#region /// state references
#引用全部角色状态索引
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall
@onready var crouch: PlayerStateCrouch = %Crouch

#endregion

#当这个初始化开始时会发生什么?
func init() -> void:
	pass

#当我们进入这个状态会发生什么?
func enter() -> void:
	pass

#当我们退出这个状态时会发生什么?
func exit() -> void:
	pass

#当按下按键处理情况会发生什么?
func handle_input( _event : InputEvent) -> PlayerState:
	return next_state
	
	
func process(_delta: float) -> PlayerState:
	return next_state

func physics_process(_delta: float) -> PlayerState:
	return next_state

	
