extends CharacterBody2D

@export var speed = 200

@onready var state_chart :StateChart= $StateChart
@onready var sprite_anime :AnimatedSprite2D= $Yosha
@onready var move_state :CompoundState= %MoveState

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func _on_idle_state_entered():
	sprite_anime.play("idle", 1, true)

func _on_walk_state_entered():
	sprite_anime.play("walk", 1, true)

func _on_walk_state_processing(delta:float):
	if velocity.length() <= 0:
		state_chart.send_event("stop")
func _on_idle_state_processing(delta:float):
	if velocity.length() > 0:
		state_chart.send_event("moving")
