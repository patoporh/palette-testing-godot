extends Sprite2D

var i = 0

func _process(delta):
	i += delta * 2
	position.x = 256 + cos(i) * 64
	position.y = 256 + sin(i) * 64