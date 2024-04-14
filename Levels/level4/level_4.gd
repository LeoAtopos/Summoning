extends Node2D

var fireball = preload("res://Levels/level4/fireball.tscn")
var fb1
var fb2
var battled:bool = false

@onready var gamer = $yosha
@onready var wizzard = $wizzard
@onready var ghost = $ghost
@onready var devel = $devel
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("level4_open_line")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Sgm.canMove: return
	if gamer.position.x >= -7 and not battled:
		Sgm.canMove = false
		battled = true
		# two monster jumping
		var tween_devel = create_tween()
		var tween_ghost = create_tween()
		tween_devel.tween_property(devel, "position", Vector2(25, gamer.position.y - 30), 0.2).set_ease(Tween.EASE_IN)
		tween_ghost.tween_property(ghost, "position", Vector2(20, gamer.position.y + 15), 0.2).set_ease(Tween.EASE_IN)
		tween_devel.tween_callback(monster_jump_in_done)

func monster_jump_in_done():
	print("monster_jump_in_done")
	Dialogic.start("level4_help_line")

func wizzard_jump_in():
	var wizzard_tween = create_tween()
	wizzard_tween.tween_property(wizzard, "position", Vector2(-50, gamer.position.y), 0.1).set_ease(Tween.EASE_IN)
	wizzard_tween.tween_callback(wizzard_jump_in_done)
func wizzard_jump_in_done():
	fb1 = fireball.instantiate()
	add_child(fb1)
	fb1.position = wizzard.position
	var tween1 = create_tween()
	tween1.tween_property(fb1, "position", devel.position, 0.5).set_ease(Tween.EASE_IN)
	tween1.tween_interval(0.04)
	fb2 = fireball.instantiate()
	add_child(fb2)
	fb2.position = wizzard.position
	var tween2 = create_tween()
	tween2.tween_property(fb2, "position", ghost.position, 0.5).set_ease(Tween.EASE_IN)
	tween2.tween_interval(0.05)
	tween2.tween_callback(ghost_hit)
	tween1.tween_interval(0.05)
	tween1.tween_callback(devel_hit)

func devel_hit():
	devel.queue_free()
	fb1.queue_free()
func ghost_hit():
	ghost.queue_free()
	fb2.queue_free()
	Dialogic.start("level4_middel_line")
	




#var tween = create_tween()
	#tween.tween_property(sigh_thought, "global_position",sigh_thought.global_position + Vector2(0, -100), 0.5).set_ease(Tween.EASE_OUT)
	#tween.tween_interval(0.3)
	#tween.tween_property(sigh_thought, "global_position",mind_switch.global_position + Vector2(mind_switch.size.x/2, 0), 0.5)
	#tween.tween_callback(delete_sigh_thought.bind(sigh_thought))

func _on_port_body_entered(body:Node2D):
	SceneManager.change_scene("res://Levels/level5/level_5.tscn",SceneManager.Transitions.FADE)
