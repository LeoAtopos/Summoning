extends Node

var gamer
var canMove :bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func call_yosha_canMove():
	canMove = true

func call_yosha_can_notMove():
	canMove = false

func cut2level2():
	SceneManager.change_scene("res://Levels/level2/level_2.tscn",SceneManager.Transitions.FADE)

func cut2level4():
	SceneManager.change_scene("res://Levels/level4/level_4.tscn",SceneManager.Transitions.FADE)
