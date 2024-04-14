extends Node2D

@onready var gamer = $yosha
@onready var wizzard = $wizzard

var isOpenMoveDone = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("level9_open_line")
	var tween_gamer = create_tween()
	var tween_wizzard = create_tween()
	tween_gamer.tween_property(gamer, "position", gamer.position + Vector2(150, 0), 2.5).set_ease(Tween.EASE_OUT)
	tween_wizzard.tween_property(wizzard, "position", wizzard.position + Vector2(125, 0), 3.9).set_ease(Tween.EASE_OUT)
	tween_gamer.tween_callback(move_in_done)

func move_in_done():
	isOpenMoveDone = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isOpenMoveDone and Sgm.islvl9old:
		Sgm.canMove = true

	if gamer.position.x >= 65 and Sgm.canMove:
		Sgm.canMove = false
		var tween_gamer = create_tween()
		var tween_wizzard = create_tween()
		tween_gamer.tween_property(gamer, "position", Vector2(114, 0), 1.5).set_ease(Tween.EASE_OUT)
		tween_wizzard.tween_property(wizzard, "position", Vector2(86, 0), 1.5).set_ease(Tween.EASE_OUT)
		tween_gamer.tween_callback(move_front_boss)

		Sgm.islvl9old = false

func move_front_boss():
	var tween = create_tween()
	tween.tween_property(get_viewport().get_camera_2d(), "offset", Vector2(20,0),0.5).set_ease(Tween.EASE_OUT)
	Dialogic.start("level9_boss_line")
