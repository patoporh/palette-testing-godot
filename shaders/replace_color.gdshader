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

float grayscale(vec3 color) {
	return (color.r + color.g + color.b) / 3.0;
}

vec3 closest_color(vec3 color) {
	float grayscale_color = grayscale(color);
	float closest_value = 1.0;
	int closest_index = 0;
	for (int i = 0; i < original_palette.length(); i++) {
		float diff = abs(grayscale(original_palette[i].rgb) - grayscale_color);
		if (diff < closest_value) {
			closest_index = i;
			closest_value = diff;
		}
	}
	return current_palette[closest_index].rgb;
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
		COLOR.rgb = closest_color(color.rgb);
}