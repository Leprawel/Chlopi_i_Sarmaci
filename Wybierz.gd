extends Node2D




func _ready():
	$Menu.hide()
	$Menu2.hide()




func _on_DodajSurowce_pressed():
	$Menu.show()
	$DodajSurowce.hide()
	$ZrodloDochodu.hide()
	$Label.hide()



func _on_ZrodloDochodu_pressed():
	$Menu2.show()
	$DodajSurowce.hide()
	$ZrodloDochodu.hide()
	$Label.hide()
