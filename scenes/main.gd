extends Node2D

var Dinitialized = false
var nameInitialize = false
var NameLabelPanel
func _ready() -> void:
	Dialogic.start("timeline")
func _process(_time: float) -> void:
	if(!Dinitialized):
		NameLabelPanel = get_tree().root.get_child(3)
		var stringName = NameLabelPanel.to_string().split(":")[0]
		assert(stringName.match("DialogicLayout_Dialogue"))
		NameLabelPanel = NameLabelPanel\
		.get_child(3).get_child(1).find_child("NameLabelPanel")
		NameLabelPanel.custom_minimum_size = \
		Vector2(206,0)
		Dinitialized = !Dinitialized
