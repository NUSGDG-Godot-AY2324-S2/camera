extends CharacterBody2D

const HORIZONTAL_SPEED = 300
const ACCELERATION = 90
const JUMP_STRENGTH = 1500
var direction
var is_moving = false


func _physics_process(delta):
	make_movement()
	adjust_animation()


func make_movement():
	direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var is_jumping = Input.is_action_just_pressed("ui_up") and is_on_floor()
	
	velocity = Vector2(direction * HORIZONTAL_SPEED,
		-JUMP_STRENGTH if is_jumping else velocity.y + ACCELERATION)
	move_and_slide()


func adjust_animation():
	if direction == 1:
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x)
	elif direction == -1:
		$AnimatedSprite2D.scale.x = -abs($AnimatedSprite2D.scale.x)
	
	if direction == 0:
		if is_moving:
			$AnimatedSprite2D.play("idle")
			is_moving = false
	else:
		if not is_moving:
			$AnimatedSprite2D.play("run")
			is_moving = true
