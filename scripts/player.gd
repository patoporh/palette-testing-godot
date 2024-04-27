extends CharacterBody2D


const MAX_SPEED = 10000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move(delta)


func move(delta):
	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	velocity.x = direction.x * MAX_SPEED * delta
	velocity.y = direction.y * MAX_SPEED * delta

	move_and_slide()
