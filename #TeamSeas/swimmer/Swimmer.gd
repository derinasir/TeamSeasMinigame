extends KinematicBody2D

onready var collision_shape = $CollisionShape2D
onready var anim_player = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var anim_state = anim_tree.get("parameters/playback")

export var speed = 75
var direction: Vector2
var horizontal_input: float
var vertical_input: float

func _ready():
	anim_tree.active = true


func _physics_process(_delta):
	set_direction()
	
	swim()


func swim():
	var velocity = direction * speed
	if direction.length() != 0:
		anim_tree.set("parameters/Idle/blend_position", horizontal_input)
		anim_tree.set("parameters/Swim/blend_position", horizontal_input)
		anim_state.travel("Swim")
		
		collision_shape.rotation = PI / 2
		velocity = move_and_slide(velocity)
	else:
		collision_shape.rotation = 0
		anim_state.travel("Idle")


func set_direction():
	horizontal_input = (
		Input.get_action_raw_strength("ui_right")
		- Input.get_action_raw_strength("ui_left")
	)
	
	vertical_input = (
		Input.get_action_raw_strength("ui_down")
		- Input.get_action_raw_strength("ui_up")
	)
	
	direction = Vector2(horizontal_input, vertical_input).normalized()
