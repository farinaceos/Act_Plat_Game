extends CharacterBody2D

const SPEED = 300.00
var animDir : String = "down"
var health: int = 100
var max_health: int = health


func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	# Manages player walk animation
	if direction.x < 0 and direction.y == 0:
		$AnimatedSprite2D.play("walk_left")
		animDir = "left"
	elif direction.x > 0 and direction.y == 0:
		$AnimatedSprite2D.play("walk_right")
		animDir = "right"
	elif direction.y < 0:
		$AnimatedSprite2D.play("walk_up")
		animDir = "up"
	elif direction.y > 0:
		$AnimatedSprite2D.play("walk_down")
		animDir = "down"
	elif direction.x == 0 and direction.y == 0: # Solution to stop animation if not walking
		$AnimatedSprite2D.pause()	
	# Attack Action
	if Input.is_action_just_pressed("attack"):
		$AnimationPlayer.play("attack_" + animDir) # Cool solution to use the move direction in the animation
	
func take_damage(damage: int):
	print("I've been hurt!" + str(damage) + " health lost")
	health -= damage
	if health <= 0:
		health = 0
		print("You Died")
	else:
		print("Ouch")
	print(health)

# Stop Point 17/08/24 - Work on damage receiving
#
#func _on_hurtbox_body_entered(body: Node2D) -> void:
	#pass
