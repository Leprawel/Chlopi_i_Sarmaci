extends Node2D




func _ready():
	pass




func _on_DodajSurowce_pressed(): 
	get_tree().change_scene("res://Menu.tscn")



func _on_ZrodloDochodu_pressed():
	get_tree().change_scene("res://Menu2.tscn")
