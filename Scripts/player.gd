extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -900.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Flip the Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	# Play Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("IDLE")
		else:
			animated_sprite_2d.play("WALK")
	else:
		animated_sprite_2d.play("JUMP")

# 16/08/24 - Trying to figure this animation... and the falling one...
func attack():
	$AnimatedSprite2D.animation = "ATTACK"
		

	move_and_slide()
