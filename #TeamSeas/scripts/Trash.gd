extends Area2D

var BubblesEffect = preload("res://effects/Bubbles.tscn")
signal picked_up

func _on_Trash_body_entered(body):
	create_effect()
	emit_signal("picked_up")
	queue_free()

func create_effect():
	var bubbles = BubblesEffect.instance()
	get_parent().add_child(bubbles)
	bubbles.position = self.position
