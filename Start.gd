extends Node

var date


func _ready():
	pass


func _on_StartButton_pressed():
	var date = OS.get_unix_time();
	get_tree().change_scene("res://Wybierz.tscn")
	print(date)
	OS.delay_msec(5000)
	print(OS.get_unix_time() - date);
