extends Area2D


func _ready():
	pass


func _on_Fire_body_entered(_body):
	if _body.has_method("playerDamage"):
		_body.playerDamage()

func _on_startTimer_timeout():
	$anim.play("on")
	$FireCol.set_deferred("disabled", false)


func _on_stopTimer_timeout():
	$anim.play("off")
	$FireCol.set_deferred("disabled", true)
