shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float scale:hint_range(0.0, 2.0, 0.1) = 2.0;
uniform float amplitude:hint_range(0.0, 0.5, 0.1) = 0.2;
uniform float speed:hint_range(0.0, 10, 0.1) = 5.0;
uniform float flicker_amount:hint_range(0.0, 0.1, 0.01) = 0.02;
uniform float flicker_rate:hint_range(0.0, 100, 0) = 50;
uniform float curvature:hint_range(0.0,7.0,0.1) = 7.0;
uniform float vigniette_multiplier: hint_range(0.0,2.0,0.0) = 1.0;

void fragment() {
	float wave = sin(FRAGCOORD.y * scale + TIME * speed) * amplitude;
	float flicker = sin(TIME * flicker_rate) * flicker_amount;
	vec2 centeredUV = SCREEN_UV * 2.0 - 1.0; // sets UV to center
	vec2 offset = centeredUV.yx / curvature; // swaps the x and y values,
	//and then divides by the curvature float
	// this will result in a very small UV mapping
	// the bigger the number, the smaller the curve
	vec2 warpedUV = centeredUV + centeredUV * offset * offset;
	/*
	Each coordinate gets stretched by an amount that depends on 
	the other axis's distance from center. Without the swap, 
	each axis would only scale itself, and the screen edges 
	would stay straight. With the swap, the top and bottom edges 
	bow depending on how far you are horizontally, 
	which produces the curved-glass look.
	we multiply by offset^2 for the quadric, curved look.
	*/
	vec3 vigniette = vec3(length(pow(abs(warpedUV),vec2(4.0)) / 3.0));
	vec3 screen_color = texture(SCREEN_TEXTURE,(warpedUV + 1.0)/2.0).rgb;
	screen_color += wave + flicker;
	screen_color -= vigniette * vigniette_multiplier;
	COLOR = vec4(screen_color,1.0);

	
	
}
