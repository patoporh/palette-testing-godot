extends CharacterBody2D


const MAX_SPEED = 10000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_h = Input.get_axis("left", "right")
	var input_v = Input.get_axis("up", "down")

	velocity.x = input_h * MAX_SPEED * delta
	velocity.y = input_v * MAX_SPEED * delta

	move_and_slide()