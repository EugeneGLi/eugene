extends Button
var history_pointer: DialogueStack
var hello;# = get_tree().root.get_node_or_null("Main");

func _pressed() -> void:
	if history_pointer:
		hello.load_dialogue_state()
	else:
		printerr("history rollback is unavailable when not in main node.")
func _ready() -> void:
	hello = get_tree().root.get_node_or_null("Main");
	if hello != null:
		history_pointer = hello.history
