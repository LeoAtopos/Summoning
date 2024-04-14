extends Node2D

@onready var bullet = $bullet
@onready var shooter = $shooter

var isShooting :bool= false
var shoot_dir
var speed = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	Sgm.canMove = false
	Dialogic.start("level5_open_line")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isShooting:
		bullet.position += shoot_dir * speed
		if bullet.position.length() > 300:
			isShooting = false
			bullet.position = shooter.position

func _input(event):
	if not Sgm.canMove: return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var mp = get_local_mouse_position()
		if not isShooting:
			var  d = mp - shooter.position
			shoot_dir = d.normalized()
			isShooting = true


