extends Node2D

signal all_clear
signal trash_picked(collected)

onready var children = get_children()
onready var pop = $Pop
var collected = 0

func _ready():
	for child in children:
		child.connect("picked_up", self, "_on_picked_up")

func _on_picked_up():
	collected += 1
	emit_signal("trash_picked", collected)
	pop.play()
	
	if collected == 8:
		emit_signal("all_clear")
