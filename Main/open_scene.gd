extends Control

var level_scene = "res://Main/level_scene.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	SceneManager.change_scene(level_scene,SceneManager.Transitions.FADE)
