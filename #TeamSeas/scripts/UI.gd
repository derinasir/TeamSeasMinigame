extends Control

onready var count = $Count
onready var start = $Start
onready var win_screen = $Win

func _ready():
	start_game()
	
	connect("all_clear", self, "_on_Trashes_all_clear")
	connect("trash_picked", self, "_on_Trashes_trash_picked")


func _on_Trashes_all_clear():
	end_game()
	pass


func _on_Trashes_trash_picked(collected):
	count.text = str(collected) + "/8"


func _input(event):
	if Input.is_key_pressed(KEY_ENTER):
		unpause()


func start_game():
	get_tree().paused = true
	start.visible = true
	count.visible = false
	win_screen.visible = false
	
func unpause():
	get_tree().paused = false
	start.visible = false
	count.visible = true

func end_game():
	get_tree().paused = true
	count.visible = false
	win_screen.visible = true
