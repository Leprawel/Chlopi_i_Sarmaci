extends Node


func _ready():
	$Wybierz.hide()


func _on_StartButton_pressed():
	$Wybierz.show()
	$StartButton.hide()
	$ChlopiISarmaci.hide()


