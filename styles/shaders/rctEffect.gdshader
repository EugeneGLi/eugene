shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float scale:hint_range(0.0, 2.0, 0.1) = 2.0;
uniform float amplitude:hint_range(0.0, 0.5, 0.1) = 0.2;
uniform float speed:hint_range(0.0, 10, 0.1) = 5.0;
uniform float flicker_amount:hint_range(0.0, 0.1, 0.01) = 0.02;
uniform float flicker_rate:hint_range(0.0, 100, 0) = 50;
	
void fragment() {
	vec4 screen = texture(SCREEN_TEXTURE,SCREEN_UV);
	float wave = sin(FRAGCOORD.y * scale + TIME * speed) * amplitude;
	float flicker = sin(TIME * flicker_rate) * flicker_amount;
	COLOR = screen;
	COLOR.rgb += wave + flicker;
	// Called for every vertex the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
