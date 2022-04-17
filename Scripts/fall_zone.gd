extends Area2D


func _on_fall_zone_body_entered(_body) -> void:
	
	if _body.name == "Player":
		Global.player_life -=  1
		Global.player_health = 3
	if _body.name == "Player" and Global.player_life < 1:
		if get_tree().change_scene("res://Scenes/Prefabs/GameOver.tscn") != OK:
			print("Algo deu errado")
	else: 
		get_tree().reload_current_scene() == OK
