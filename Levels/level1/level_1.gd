extends Node2D

@onready var gamer = $yosha
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("open_line")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_port_body_entered(body:Node2D):
	Sgm.call_yosha_can_notMove()
	Dialogic.start("level1_portout_line")

