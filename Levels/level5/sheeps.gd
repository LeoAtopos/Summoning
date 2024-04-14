extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var num = get_child_count()
	if num == 0 and Sgm.canMove:
		Sgm.canMove = false
		await get_tree().create_timer(1.0).timeout
		Dialogic.start("level5_out_line")
