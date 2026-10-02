## A Stack ADT backed by a Singly Linked List
## used for tracking the history of Dialogic dialogue.
## Can store values / objects of different types
class_name DialogueStack


func _init() -> void:
	head = null
	size = 0
var head: stackNode
var size: int
## node for storing data
class stackNode:
	## Node class used for implementing the DialogueStack.
	var next: stackNode = null
	var data
	func _init(passedData) -> void:
		data = passedData
	func _to_string() -> String:
		return "[" + str(data) + "]"
func push(v):
	var newNode = stackNode.new(v)
	if(head == null):
		head = newNode
		return
	newNode.next = head
	head = newNode
	size+=1
func pop():
	if head == null: return null
	var data = head.data
	head = head.next
	size-=1
	return data
func peek():
	return head.data
func _to_string() -> String:
	if(head == null):
		return "This Stack is empty"
	else:
		var curr = head
		var output = ""
		while(curr != null):
			output += curr.to_string()
			curr = curr.next
		return output
