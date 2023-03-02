shader_type canvas_item;
vec2 _textureSize(sampler2D _samp2d, int _effect, ) {
	return vec2(textureSize(_samp2d, _effect));
}

/*

uniform float pixelFactor : hint_range(0.0, 1.0, 0.01);

void fragment() {
	vec2 pixelNumber = vec2(textureSize(TEXTURE, 0)) * pixelFactor;
	vec2 pixelatedUV = round(UV * pixelNumber) / pixelNumber;
	COLOR = texture(TEXTURE, pixelatedUV);
}
*/