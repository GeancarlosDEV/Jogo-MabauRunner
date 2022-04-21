extends Area2D

signal PlayerEntered

func _physics_process(_delta: float) -> void:
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "Player":
			emit_signal("PlayerEntered")
			queue_free()


func _on_Boss_BossDead():
	pass # Replace with function body.
