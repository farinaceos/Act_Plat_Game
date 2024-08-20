extends CharacterBody2D

@export var health_points := 30

func take_damage(damage : int) -> void:
	print("OUCH")
	health_points -= damage
	if health_points <= 0:
		queue_free()
	else:
		print(str(health_points) + " life Remaining")
