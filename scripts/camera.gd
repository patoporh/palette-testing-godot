extends Camera2D


var tween: Tween
var screen_size
const ANIMATION_LENGTH = 0.3


func _ready():
	screen_size = get_viewport_rect().size


## Moves the camera to the player's new position
func update_position():
	var new_position = floor(
		(get_parent().global_position) / screen_size
	) * screen_size

	if tween:
		tween.kill()
	
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, ANIMATION_LENGTH)