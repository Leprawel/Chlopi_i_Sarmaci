extends Node2D

var zasoby = {} 

func _ready():
	get_node("Start")
	$Start/ChlopiISarmaci.hide()
	$Start/StartButton.hide()
	print($Start.date)

func _on_Dodaj2_pressed():
	if zasoby.has($Zasob.text) :
		zasoby[$Zasob.text] += int($Ilosc.text)
	else :
		zasoby[$Zasob.text] = int($Ilosc.text)
	$Zasob.clear()
	$Ilosc.clear()
	print(zasoby)
	$Label.text = str(zasoby)


func _on_Refresh_pressed():
	var new_date = OS.get_unix_time()
	print($Start.date)
	print(new_date)
