extends Node


## PaletteShader, used for changing the game's palette
@onready var palette_shader = get_node("/root/World/PaletteShader")


## Palettes used for the game
var palettes = {
	"kirokaze":         PaletteShader.new_palette("#332c50,#46878f,#94e344,#e2f3e4"),
	"marrow4":          PaletteShader.new_palette("#190700,#803715,#aa8733,#d2d0b3"),
	"2bit_demichrome":  PaletteShader.new_palette("#211e20,#555568,#a0a08b,#e9efec"),
	"ayy4":             PaletteShader.new_palette("#00303b,#ff7777,#ffce96,#f1f2da"),
	"bittersweet":      PaletteShader.new_palette("#282328,#545c7e,#c56981,#a3a29a"),
	"blk_aqu4":         PaletteShader.new_palette("#002b59,#005f8c,#00b9be,#9ff4e5"),
	"bluem0ld":         PaletteShader.new_palette("#191b1a,#294257,#579c9a,#99c9b3"),
	"crimson":          PaletteShader.new_palette("#1b0326,#7a1c4b,#ba5044,#eff9d6"),
	"gold_toad":        PaletteShader.new_palette("#283593,#00695c,#ffb74d,#fff59d"),
	"hallowpumpkin":    PaletteShader.new_palette("#300030,#602878,#f89020,#f8f088"),
	"hollow":           PaletteShader.new_palette("#0f0f1b,#565a75,#c6b7be,#fafbf6"),
	"honeygb":          PaletteShader.new_palette("#3e3a42,#877286,#f0b695,#e9f5da"),
	"ice_cream":        PaletteShader.new_palette("#7c3f58,#eb6b6f,#f9a875,#fff6d3"),
	"lava":             PaletteShader.new_palette("#051f39,#4a2480,#c53a9d,#ff8e80"),
	"mist":             PaletteShader.new_palette("#2d1b00,#1e606e,#5ab9a8,#c4f0c2"),
	"moonlight":        PaletteShader.new_palette("#0f052d,#203671,#36868f,#5fc75d"),
	"pinball":          PaletteShader.new_palette("#160b09,#502010,#f66010,#eebb90"),
	"rustic":           PaletteShader.new_palette("#2c2137,#764462,#a96868,#edb4a1"),
	"spacehaze":        PaletteShader.new_palette("#0b0630,#6b1fb1,#cc3495,#f8e3c4"),
	"warm_ochre":       PaletteShader.new_palette("#242021,#93722d,#cbae70,#eee6cf"),
	"wish":             PaletteShader.new_palette("#622e4c,#7550e8,#608fcf,#8be5ff")
}


func _ready():
	# Sets the original palette for the game's sprites
	palette_shader.set_original_palette(palettes.marrow4)

	## Sets the current palette
	palette_shader.set_palette(palettes.warm_ochre)
