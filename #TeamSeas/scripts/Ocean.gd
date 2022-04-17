extends Node

onready var audio = $Ambiance

func _ready():
	audio.play()


func _on_Trashes_all_clear():
	$Swimmer.queue_free()
	$Trashes.queue_free()
