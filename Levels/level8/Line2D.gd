extends Line2D

# 定义旋转最小和最大角度（弧度）
var min_angle = deg_to_rad(-90)
var max_angle = deg_to_rad(0)
# 定义速度
var rotation_speed = 1.0
# 设置方向
var rotation_direction = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# if not Sgm.golf_can_go: return
    # 根据时间增加当前旋转角度
	rotation += rotation_direction * rotation_speed * delta
    
    # 将角度限制在最小和最大角度之间
	if rotation < min_angle:
		rotation = min_angle
		rotation_direction *= -1  # 改变旋转方向
	elif rotation > max_angle:
		rotation = max_angle
		rotation_direction *= -1  # 改变旋转方向