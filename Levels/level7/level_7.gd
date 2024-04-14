extends Node2D

@onready var gamer = $yosha
@onready var wizzard = $wizzard
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween_gamer = create_tween()
	var tween_wizzard = create_tween()
	tween_gamer.tween_property(gamer, "position", gamer.position + Vector2(250, 0), 3.5).set_ease(Tween.EASE_OUT)
	tween_wizzard.tween_property(wizzard, "position", wizzard.position + Vector2(225, 0), 5.9).set_ease(Tween.EASE_OUT)
	tween_gamer.tween_callback(move_in_done)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move_in_done():
	Dialogic.start("level7_open_line")

func _on_port_body_entered(body:Node2D):
	Sgm.canMove = false
	SceneManager.change_scene("res://Levels/level8/level_8.tscn",SceneManager.Transitions.FADE)
