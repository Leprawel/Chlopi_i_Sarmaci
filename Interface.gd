extends Node2D

func _ready():
	$Menu.hide()
	$Pancerni.hide()
	$Pancerni2.hide()
	date = OS.get_unix_time()

func _on_Start_button_pressed():
	$Start.hide()
	$Menu.show()

func _on_Add_pressed():
	$Menu.hide()
	$Pancerni.show()

func _on_Income_pressed():
	$Menu.hide()
	$Pancerni2.show()

func _on_Arrow_menu3_pressed():
	$Menu.show()
	$Pancerni.hide()

func _on_Arrow_menu8_pressed():
	$Menu.show()
	$Pancerni2.hide()

var resource = {}
var manufacturer = {}
var date
var new_date
var score = 0
var new_score = 0

func Pancerni_add():   
	if resource.has($Pancerni/Resource.text):
		resource[$Pancerni/Resource.text] += int($Pancerni/Value.text)
	else :
		resource[$Pancerni/Resource.text] = int($Pancerni/Value.text)
	$Pancerni/Resource.clear()
	$Pancerni/Value.clear()
	print(resource)

func Pancerni2_add():
	if manufacturer.has($Pancerni2/Resource2.text):
		manufacturer[$Pancerni2/Resource2.text] += int($Pancerni2/Value2.text)
	else :
		manufacturer[$Pancerni2/Resource2.text] = int($Pancerni2/Value2.text)
	$Pancerni2/Resource2.clear()
	$Pancerni2/Value2.clear()
	print(manufacturer)
	print(resource)

func Refresh_date():
	new_date = OS.get_unix_time()
	score = new_date - date
	new_score += score
	date = new_date
	while new_score >= 20:
		if manufacturer.has("Drewno") || resource.has("Drewno"):
			resource["Drewno"] += manufacturer["Drewno"]
		if manufacturer.has("Kamien") || resource.has("Kamien"):
			resource["Kamien"] += manufacturer["Kamien"]
		new_score -= 20
	print(resource)
	print(new_score)




