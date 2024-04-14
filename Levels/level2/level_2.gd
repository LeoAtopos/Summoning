extends Node2D

@onready var gamer = $yosha
# Called when the node enters the scene tree for the first time.
func _ready():
	var mo = gamer.modulate
	mo.a = 0
	gamer.modulate = mo
	Dialogic.start("level2_open_line")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_port_body_entered(body:Node2D):
	SceneManager.change_scene("res://Levels/level3/level_3.tscn",SceneManager.Transitions.FADE)
