shader_type canvas_item;
vec2 _pixelateUV(vec2 _pixelate_uv, vec2 _effect_factor_pixelate, sampler2D _samp2d) {
	ivec2 _t = textureSize(_samp2d, 0);
	return round(vec2(_t) * _effect_factor_pixelate) / _effect_factor_pixelate;
}

/*

uniform float pixelFactor : hint_range(0.0, 1.0, 0.01);

void fragment() {
	vec2 pixelNumber = vec2(textureSize(TEXTURE, 0)) * pixelFactor;
	vec2 pixelatedUV = round(UV * pixelNumber) / pixelNumber;
	COLOR = texture(TEXTURE, pixelatedUV);
}
*/