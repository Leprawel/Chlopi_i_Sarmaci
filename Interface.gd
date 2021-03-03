extends Node2D


func _ready():
	$Menu.hide()
	$Choose.hide()
	$Choose2.hide()
	$Pancerni.hide()
	$Pancerni2.hide()
	$Dragoni.hide()
	$Dragoni2.hide()
	$Rajtarzy.hide()
	$Rajtarzy2.hide()
	$Lisowczycy.hide()
	$Lisowczycy2.hide()
	$Korsarze.hide()
	$Korsarze2.hide()
	date = OS.get_unix_time()
	print(date)

func _physics_process(delta):
	if $Start/Start_button.pressed:
		$Menu.show()
		$Start.hide()
	elif $Menu/Add.pressed:
		$Menu.hide()
		$Choose.show()
	elif $Menu/Income.pressed:
		$Menu.hide()
		$Choose2.show()
	elif $Choose/Pancerni_button.pressed:
		$Choose.hide()
		$Pancerni.show()
	elif $Choose/Dragoni_button.pressed:
		$Choose.hide()
		$Dragoni.show()
	elif $Choose/Rajtarzy_button.pressed:
		$Choose.hide()
		$Rajtarzy.show()
	elif $Choose/Lisowczycy_button.pressed:
		$Choose.hide()
		$Lisowczycy.show()
	elif $Choose/Korsarze_button.pressed:
		$Choose.hide()
		$Korsarze.show()
	elif $Choose2/Pancerni2_button.pressed:
		$Choose2.hide()
		$Pancerni2.show()
	elif $Choose2/Dragoni2_button.pressed:
		$Choose2.hide()
		$Dragoni2.show()
	elif $Choose2/Rajtarzy2_button.pressed:
		$Choose2.hide()
		$Rajtarzy2.show()
	elif $Choose2/Lisowczycy2_button.pressed:
		$Choose2.hide()
		$Lisowczycy2.show()
	elif $Choose2/Korsarze2_button.pressed:
		$Choose2.hide()
		$Korsarze2.show()
	elif $Choose/Arrow_menu.pressed || $Choose2/Arrow_menu2.pressed:
		$Choose.hide()
		$Choose2.hide()
		$Menu.show()
	elif $Pancerni/Arrow_menu3.pressed || $Dragoni/Arrow_menu4.pressed || $Rajtarzy/Arrow_menu5.pressed || $Lisowczycy/Arrow_menu6.pressed || $Korsarze/Arrow_menu7.pressed:
		$Choose.show()
		$Pancerni.hide()
		$Dragoni.hide()
		$Rajtarzy.hide()
		$Lisowczycy.hide()
		$Korsarze.hide()
	elif $Pancerni2/Arrow_menu8.pressed:
		$Pancerni2.hide()
		$Choose2.show()
	if new_score >= 20:
		array["Drewno"] += 2
		new_score = 0

var array = {}
var resources = {}
var date
var new_date
var score = 0
var new_score = 0
func Pancerni_add():   
	if array.has($Pancerni/Resource.text):
		array[$Pancerni/Resource.text] += int($Pancerni/Value.text)
	else :
		array[$Pancerni/Resource.text] = int($Pancerni/Value.text)
	$Pancerni/Resource.clear()
	$Pancerni/Value.clear()
	print(array)

func Pancerni2_add():
	if resources.has($Pancerni2/Resource2.text):
		resources[$Pancerni2/Resource2.text] += int($Pancerni2/Value2.text)
	else :
		resources[$Pancerni2/Resource2.text] = int($Pancerni2/Value2.text)
	$Pancerni2/Resource2.clear()
	$Pancerni2/Value2.clear()
	print(resources)
	print(array)

func Refresh_date():
	new_date = OS.get_unix_time()
	score = new_date - date
	new_score += score
	date = new_date
	print(new_score)
	print(array)
