extends KinematicBody2D


onready var anim = $anim
onready var timer =  $timer


onready var resert_position = global_position

var velocity = Vector2.ZERO
var gravity = 720
var is_triggered = false
export var resert_timer = 3.0


func _ready():
	set_physics_process(false)
	pass # Replace with function body.
	
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta

func collide_with(_collision: KinematicCollision2D, _collider: KinematicBody2D):
	if !is_triggered:
		is_triggered = true
		anim.play("shake")
		velocity = Vector2.ZERO


func _on_anim_animation_finished(_anim_name: String) -> void:
	set_physics_process(true)
	timer.start(resert_timer)
	


func _on_timer_timeout():
	set_physics_process(false)
	yield(get_tree(), "physics_frame")
	var temp = collision_layer
	collision_layer = 0
	global_position = resert_position
	yield(get_tree(), "physics_frame")
	collision_layer = temp
	is_triggered = false
