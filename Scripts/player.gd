extends CharacterBody2D

const SPEED = 300.00

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if direction.x < 0 and direction.y == 0:
		$AnimatedSprite2D.play("walk_left")
	elif direction.x > 0 and direction.y == 0:
		$AnimatedSprite2D.play("walk_right")
	elif direction.y < 0:
		$AnimatedSprite2D.play("walk_up")
	elif direction.y > 0:
		$AnimatedSprite2D.play("walk_down")
