extends CharacterBody2D

const HORIZONTAL_SPEED = 300
const ACCELERATION = 90
const JUMP_STRENGTH = 1500


func _physics_process(delta):
	make_movement()


func make_movement():
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var is_jumping = Input.is_action_just_pressed("ui_up") and is_on_floor()
	
	velocity = Vector2(direction * HORIZONTAL_SPEED,
		-JUMP_STRENGTH if is_jumping else velocity.y + ACCELERATION)
	move_and_slide()
