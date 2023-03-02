@tool
class_name VisualShaderNodetextureSize
extends VisualShaderNodeCustom

func _init() -> void:
	set_input_port_default_value(1, 0)

func _get_name() -> String:
	return "TextureSize"

func _get_category() -> String:
	return "UV"

#func _get_subcategory():
#	return ""

func _get_description() -> String:
	return """asd
Note: asd"""

func _get_return_icon_type() -> int:
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_input_port_count() -> int:
	return 2

func _get_input_port_name(port: int):
	match port:
		0:
			return "Sampler2D"
		1:
			return "Size"


func _get_input_port_type(port: int):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_SAMPLER
		1:
			return VisualShaderNode.PORT_TYPE_SCALAR_INT
			

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "ivec2"

func _get_output_port_type(port: int) -> int:
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_global_code(mode: int) -> String:
	var code : String = preload("textureSize.gdshader").code
	code = code.replace("shader_type canvas_item;\n", "")
	return code

func _get_code(input_vars: Array, output_vars: Array, mode: int, type: int) -> String:
	return "%s.xy = _textureSize(%s, %s);" % [output_vars[0], input_vars[0], input_vars[1],]
