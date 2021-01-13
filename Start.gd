extends Node


func _ready():
	$Menu.hide()


func _on_StartButton_pressed():
	$Menu.show()
	$StartButton.hide()
	$ChlopiISarmaci.hide()



