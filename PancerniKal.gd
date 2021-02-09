extends Node2D


func _ready():
	pass


func _on_Dodaj_pressed():
	var tablica = {}
	tablica["Drewno"] = 5
	if tablica.has($Zasob_edit.text) :
		tablica[$Zasob_edit.text] += int($Ilosc_edit.text)
	else :
		tablica[$Zasob_edit.text] = int($Ilosc_edit.text)
	$Zasob_edit.clear()
	$Ilosc_edit.clear()
	print(tablica)
