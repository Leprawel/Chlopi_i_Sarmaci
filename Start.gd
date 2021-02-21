extends Node

var data_dictionary = {}


func _ready():
	pass


func _on_StartButton_pressed():
	var date = OS.get_date()
	data_dictionary["New_date"] = date
	get_tree().change_scene("res://Wybierz.tscn")
	print(date)
