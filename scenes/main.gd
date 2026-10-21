extends Node2D
##Main script. Handles calls to Dialogic
##and to the Audio Manager.
##Also handles rollback history.
##It does lots of things.
class_name MainClass
var Dinitialized = false
var nameInitialize = false
var dialogic: Node
var history: DialogueStack = DialogueStack.new()
func _ready() -> void:
	dialogic = Dialogic.start(ScoreManager.next_timeline_name)
	Dialogic.Text.text_finished.connect(save_dialogue_state)
	Dialogic.signal_event.connect(on_dialog_signal)
@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	##saves the current state of Dialogic to a stack of saved states
	##returns the last saved Dialogic state, thus a rollback occurs
	#if(event.is_action_pressed("ui_cancel")):
		#load_dialogue_state()
	pass
func save_dialogue_state(info: Dictionary):
		var temp = Dialogic.get_full_state()
		history.push(temp)
		print("saved")

func load_dialogue_state():
		var temp = history.pop()
		if(temp == null): return
		if(temp.event_index == Dialogic.get_full_state().event_index):
			temp = history.pop()
			if(temp == null): return
		Dialogic.load_full_state(temp)
func on_dialog_signal(arg: String) -> void:
	if arg == "clear_history":
		history.clear()
