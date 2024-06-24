class_name DecisionButton
extends Button

@export var yes_icon:Sprite2D
@export var no_icon:Sprite2D

var is_set:bool
var frozen: = false

# Called when the node enters the scene tree for the first time.
func _ready():
	toggled.connect(set_choice)
	reset()

func reset():
	frozen = false
	is_set = false
	button_pressed = false
	yes_icon.visible = false
	no_icon.visible = false
	
func freeze():
	frozen = true

func set_choice(toggled_on):
	if frozen:
		return
	is_set = true
	yes_icon.visible = toggled_on
	no_icon.visible = not toggled_on
