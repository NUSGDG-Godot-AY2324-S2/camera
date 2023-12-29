extends Camera2D


func _ready():
	zoom = Vector2(1.5, 1.5)


func adjust_limits(top, bottom):
	limit_top = top
	limit_bottom = bottom


func adjust_left_right(left, right):
	limit_left = left
	limit_right = right
