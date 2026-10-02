extends Node2D

var Dinitialized = false
var nameInitialize = false
var dialogic: Node
var history: DialogueStack = DialogueStack.new()
func _ready() -> void:
	dialogic = Dialogic.start("timeline")
var saved_state
var input_count = 0
func _input(event: InputEvent) -> void:
	##saves the current state of Dialogic to a stack of saved states
	if(event.is_action_pressed("ui_accept")): # inputs such as space
		#check for whether or not we have already saved this
		var temp = Dialogic.get_full_state()
		input_count += 1
		if(saved_state == null || saved_state.event_index != temp.event_index):
			saved_state = temp
			history.push(saved_state)
	##returns the last saved Dialogic state, thus a rollback occurs
	if(event.is_action_pressed("ui_cancel")):
		var temp = history.pop()
		while(temp.event_index == Dialogic.get_full_state().event_index):
			temp = history.pop()
		Dialogic.load_full_state(temp)


func on_connect():
	pass
