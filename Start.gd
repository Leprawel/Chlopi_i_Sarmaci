extends Node

var date setget date_set, date_get

func date_set(new_value):
	date = new_value

func date_get():
	return date

func _ready():
	pass


func _on_StartButton_pressed():
	date = OS.get_unix_time();
	get_tree().change_scene("res://Wybierz.tscn")
	print(date)
	#OS.delay_msec(1000)
	#print(OS.get_unix_time() - date);
