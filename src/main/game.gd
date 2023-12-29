extends Node2D


func _ready():
	var top = $Map/top1.position.y
	var bottom = $Map/bottom1.position.y
	$Player/Camera2D.adjust_limits(top, bottom)
	
	var rect = $Map.get_used_rect()
	var size = $Map.cell_quadrant_size
	$Player/Camera2D.adjust_left_right(rect.position.x * size, rect.end.x * size)
