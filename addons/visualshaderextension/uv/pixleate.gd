@tool
class_name VisualShaderNodepixelate
extends VisualShaderNodeCustom

func _init() -> void:
	set_input_port_default_value(1, Vector3(64, 64, 0))

func _get_name() -> String:
	return "Pixelate"

func _get_category() -> String:
	return "UV"

#func _get_subcategory():
#	return ""

func _get_description() -> String:
	return """Pixelate UV by size factor
Note: may produce artifacts if applied to texture with mipmaps enabled"""

func _get_return_icon_type() -> int:
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_input_port_count() -> int:
	return 3

func _get_input_port_name(port: int):
	match port:
		0:
			return "uv"
		1:
			return "Size"
		2: 
			return "Sampler2D"

func _get_input_port_type(port: int):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR_2D
		1:
			return VisualShaderNode.PORT_TYPE_VECTOR_2D
		2: 
			return VisualShaderNode.PORT_TYPE_SAMPLER

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "uv"

func _get_output_port_type(port: int) -> int:
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_global_code(mode: int) -> String:
	var code : String = preload("pixelate.gdshader").code
	code = code.replace("shader_type canvas_item;\n", "")
	return code

func _get_code(input_vars: Array, output_vars: Array, mode: int, type: int) -> String:
	var uv = "uv"
	
	if input_vars[0]:
		uv = input_vars[0]
	
	return "%s.xy = _pixelateUV(%s.xy, %s.xy, %s);" % [output_vars[0], uv, input_vars[1], input_vars[2]]
