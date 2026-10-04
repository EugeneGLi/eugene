@tool
extends DialogicLayoutLayer

@export_group("Box")

@export_subgroup("Size & Position")
@export var box_size: Vector2 = Vector2(500,120)
@export var box_margin_bottom: int = 0

@export_subgroup("Panel")
@export_file("*.tres") var box_panel: String = this_folder.path_join("vn_textbox_default_panel.tres")


@export_subgroup("Color")
@export var box_color_use_global: bool = true
@export var box_color_custom: Color = Color.BLACK


@export_group("Input Text")
@export_subgroup("Color")
@export var text_use_global_color: bool = true
@export var text_custom_color: Color = Color.WHITE

@export_subgroup('Font')
@export var text_use_global_font: bool = true
@export_file('*.ttf', '*.tres') var input_font: String = ""


@export_group("Confirm Box")
@export_subgroup("Text")
@export var confirm_text_use_global_color: bool = true
@export var confirm_text_custom_color: Color = Color.WHITE
@export var confirm_text_hover_color: Color = Color.WHITE
@export var confirm_text_use_global_font: bool = true
@export_file('*.ttf', '*.tres') var confirm_font: String = ""
## A layer that contains a text-input node.


func _apply_export_overrides() -> void:
	var layer_theme: Theme = get(&'theme')
	if layer_theme == null:
		layer_theme = Theme.new()

	if get_global_setting(&'font', ''):
		layer_theme.default_font = load(get_global_setting(&'font', '') as String)
	layer_theme.default_font_size = get_global_setting(&'font_size', 0)
	
	##Box Settings
	_apply_box_settings()
	_apply_text_settings()
	_apply_confirm_settings()

func _apply_box_settings() -> void:
	var dialog_text_panel: Container = %TextInputPanel
	if ResourceLoader.exists(box_panel):
		dialog_text_panel.add_theme_stylebox_override(&'panel', load(box_panel) as StyleBox)

	if box_color_use_global:
		dialog_text_panel.self_modulate = get_global_setting(&'bg_color', box_color_custom)
	
	dialog_text_panel.self_modulate = box_color_custom
	
	
func _apply_text_settings() -> void:
	var input_text: LineEdit = $DialogicNode_TextInput/TextInputPanel/VBoxContainer/InputField
	if text_use_global_color:
		input_text.add_theme_color_override(&"font_color", get_global_setting(&'font_color', text_custom_color) as Color)
	else:
		input_text.add_theme_color_override(&"font_color", text_custom_color)
	if text_use_global_font and get_global_setting(&'font', false):
		input_text.add_theme_font_override(&"font", load(get_global_setting(&'font', '') as String) as Font)
	elif !input_font.is_empty():
		input_text.add_theme_font_override(&"font", load(input_font) as Font)

func _apply_confirm_settings() -> void:
	var confirm_button: Button = $DialogicNode_TextInput/TextInputPanel/VBoxContainer/ConfirmationButton
	if text_use_global_color:
		confirm_button.add_theme_color_override(&"font_color", get_global_setting(&'font_color', confirm_text_custom_color) as Color)
	else:
		confirm_button.add_theme_color_override(&"font_color", confirm_text_custom_color)
	
	if text_use_global_color:
		var colores : Color = get_global_setting(&'font_hover_color', confirm_text_hover_color)
		confirm_button.add_theme_color_override(&"font_hover_color", colores.inverted())
	else:
		confirm_button.add_theme_color_override(&"font_hover_color", confirm_text_hover_color)
	
	if confirm_text_use_global_font and get_global_setting(&'font', false):
		confirm_button.add_theme_font_override(&"font", load(get_global_setting(&'font', '') as String) as Font)
	elif !input_font.is_empty():
		confirm_button.add_theme_font_override(&"font", load(input_font) as Font)

	
	
