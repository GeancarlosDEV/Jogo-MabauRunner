extends CanvasLayer


func _ready():
	pass


func _on_BtnRetry_pressed():
	if get_tree().change_scene("res://Scenes/Prefabs/startScreen.tscn") != OK:
		print("Algo deu errado")
	if Global.is_dead:
		Global.player_health = 3
