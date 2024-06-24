extends Node2D

@export var candidate_list:Array[CandidateRes]
@export var animation:AnimatedSprite2D
@export var animation_delay: = 0.3
@export var text_delay: = 0.3
@export var conversation:Conversation
@export var decide:Decide

var current: = 0

func _ready():
	hide()
	animation.hide()

func start_next():
	show()
	animation.hide()
	if current < candidate_list.size():
		await get_tree().create_timer(animation_delay).timeout
		var candidate = candidate_list[current]
		animation.frame = candidate.frame
		animation.show()
		conversation.starting_conv = candidate.first_conversation
		conversation.reset()
		decide.reset(candidate)
		await get_tree().create_timer(text_delay).timeout
		conversation.start()
		current += 1
