extends Node2D

var open_scene = "res://Main/open_scene.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("esc"):
		SceneManager.change_scene(open_scene,SceneManager.Transitions.FADE)