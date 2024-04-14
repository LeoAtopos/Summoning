extends Node2D

@onready var arrow = %arrow
@onready var state_chart = $StateChart

var stage = "pause" # pause,aiming,powering,shooting,stopped,goaled
# Called when the node enters the scene tree for the first time.
func _ready():
	print(arrow.is_processing())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(arrow.is_processing())


func _on_pause_state_entered():
	arrow.set_process(false)
	Dialogic.start("level8_open_line")


func _on_pause_state_processing(delta:float):
	if Sgm.golf_can_go:
		state_chart.send_event("start aiming")


func _on_aiming_state_entered():
	arrow.set_process(true)
