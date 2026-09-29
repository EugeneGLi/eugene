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

func _apply_box_settings() -> void:
	var dialog_text_panel: Container = %TextInputPanel
	if ResourceLoader.exists(box_panel):
		dialog_text_panel.add_theme_stylebox_override(&'panel', load(box_panel) as StyleBox)

	if box_color_use_global:
		dialog_text_panel.self_modulate = get_global_setting(&'bg_color', box_color_custom)
	
	dialog_text_panel.self_modulate = box_color_custom
