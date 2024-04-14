extends CanvasLayer
class_name PaletteShader


## ColorRect, used for covering the screen with the palette shader
@onready var color_rect = $ColorRect


func _ready():
	# Enables the shader on startup
	self.enable()


## Disables the palette shader
func disable():
	color_rect.visible = false;


## Enables the palette shader
func enable():
	color_rect.visible = true;


## Sets the original palette, used in the game's sprites
func set_original_palette(palette: PackedColorArray):
	if not color_rect:
		await self.ready
	color_rect.material.set_shader_parameter("original_palette", palette)


## Sets the current palette
func set_palette(palette: PackedColorArray):
	if not color_rect:
		await self.ready
	color_rect.material.set_shader_parameter("current_palette", palette)


## Parses a comma separated list of hex colors and returns a PackedColorArray
static func new_palette(hexes: String):
	var palette = PackedColorArray()
	for hex in hexes.split(","):
		palette.append(hex)
	return palette
