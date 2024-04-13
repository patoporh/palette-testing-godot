shader_type canvas_item;

// Original palette, used in the game's sprites
uniform vec4[4] original_palette: source_color;
// Palette to replace the original sprite palette with
uniform vec4[4] current_palette: source_color;

uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;
const float EPSILON = 0.01;

bool in_range(vec3 color1, vec3 color2) {
	vec3 diff = abs(color1 - color2);
	if (diff.r + diff.g + diff.b < EPSILON)
		return true;
	return false;
}

void fragment() {
    vec3 color = texture(screen_texture, SCREEN_UV).rgb;
	bool changed = false;
	
	// Compare the original palette's colors against the fragment
	for (int i = 0; i < original_palette.length(); i++) {
		if (in_range(color, original_palette[i].rgb)) {
			color = current_palette[i].rgb;
			changed = true;
			break;
		}
	}
	
	if (changed)
		COLOR.rgb = color.rgb;
	else
		COLOR.rgb = current_palette[0].rgb;
}