extends Node


## ColorRect which has a shader used to change the game's palette
@onready var color_rect = get_node("/root/World/CanvasLayer/ColorRect")


## Palettes used for the game
var palettes = {
	"kirokaze": new_palette("332c50,46878f,94e344,e2f3e4"),
	"marrow4": new_palette("190700,803715,aa8733,d2d0b3")
}


func _ready():
	# Set the palette shader node visible
	color_rect.visible = true

	# Sets the original palette for the game's sprites
	set_original_palette(palettes.kirokaze)

	# Sets the current palette
	set_palette(palettes.marrow4)


## Parses a comma separated list of hex colors and returns a PackedColorArray
func new_palette(hexes: String):
	var palette = PackedColorArray()
	for hex in hexes.split(","):
		palette.append(hex)
	return palette



## Sets the original palette, used in the game's sprites
func set_original_palette(palette: PackedColorArray):
	color_rect.material.set_shader_parameter("original_palette", palette)


## Sets the current palette
func set_palette(palette: PackedColorArray):
	color_rect.material.set_shader_parameter("current_palette", palette)