extends Node2D

var Dinitialized = false
var nameInitialize = false
var NameLabelPanel
func _ready() -> void:
	Dialogic.start("timeline")
