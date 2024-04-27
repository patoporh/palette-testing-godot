extends CharacterBody2D


const MAX_SPEED = 5000
const FRICTION = 700
const ACCELERATION = 2000


func _physics_process(delta):
	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)

	if direction != Vector2.ZERO:
		velocity += direction * ACCELERATION * delta
		velocity = velocity.limit_length(MAX_SPEED * delta)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()
