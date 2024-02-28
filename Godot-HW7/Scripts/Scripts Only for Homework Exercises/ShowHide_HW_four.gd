extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _show():
	self.visible = true

func _hide():
	self.visible = false

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	_show()
	pass # Replace with function body.


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	_hide()
	pass # Replace with function body.

func _on_open_door_button_pressed():
	_show()
	pass # Replace with function body.


func _on_close_door_button_pressed():
	_hide()
	pass # Replace with function body.
