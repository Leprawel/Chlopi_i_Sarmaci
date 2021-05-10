extends Node2D


var resource = {}
var manufacturer = {}
var date
var new_date
var score = 0
var new_score = 0
var size = 0
var timer = 10
onready var elem = preload('res://Text.tscn')
onready var elem2 = preload('res://Text2.tscn')

func _input(event):
	if $Lista.position.x < 65:
		$Lista.position.x = 65
	if $Lista.position.x > 65:
		$Lista.position.x = 65
	if $Lista.position.y > 200:
		$Lista.position.y = 200
	if $Lista1.position.x < 350:
		$Lista1.position.x = 350
	if $Lista1.position.x > 350:
		$Lista1.position.x = 350
	if $Lista1.position.y > 200:
		$Lista1.position.y = 200
	if $Resource.position.x < 0:
		$Resource.position.x = 0
	if $Resource.position.x > 0:
		$Resource.position.x = 0
	if $Resource.position.y > 0:
		$Resource.position.y = 0
	if event is InputEventScreenDrag:
		$Lista.position += event.relative
		$Lista1.position += event.relative
		$Resource.position += event.relative




func _ready():
	$Menu.hide()
	$Pancerni.hide()
	$Pancerni2.hide()
	$Resource.hide()
	$Lista.hide()
	$Lista1.hide()
	$Arrow.hide()
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

func _on_Resource_pressed():
	$Menu.hide()
	$Lista.show()
	$Lista1.show()
	$Resource.show()
	$Arrow.show()
	$Resource.position.y = 0
	$Lista.position.y = 200
	$Lista1.position.y = 200
	new_date = OS.get_unix_time()
	score = new_date - date
	new_score += score
	date = new_date
	while new_score >= timer:
		for item in resource:
			if manufacturer.has(item):
				resource[item] += manufacturer[item]
		new_score -= timer
	var n = 0
	var m = 0
	for i in resource.keys():
		var newElement = elem.instance()
		newElement.setText(i,resource[i])
		newElement.position = Vector2(0,n*120)
		$Lista.add_child(newElement)
		n += 1
	for i in manufacturer.keys():
		var newElement2 = elem2.instance()
		newElement2.setText2(i,manufacturer[i])
		newElement2.position = Vector2(0,m*120)
		$Lista1.add_child(newElement2)
		m += 1

func _on_Arrow_pressed():
	$Menu.show()
	$Arrow.hide()
	$Resource.hide()
	delete_children($Lista)
	delete_children($Lista1)




func _on_Arrow_menu3_pressed():
	$Menu.show()
	$Pancerni.hide()
	$Lista.hide()

func _on_Arrow_menu8_pressed():
	$Menu.show()
	$Pancerni2.hide()



func Pancerni_add(): 
	if resource.has($Pancerni/Resource.text):
		resource[$Pancerni/Resource.text] += int($Pancerni/Value.text)
	else :
		resource[$Pancerni/Resource.text] = int($Pancerni/Value.text)
	size = resource.size()
	$Pancerni/Resource.clear()
	$Pancerni/Value.clear()


func Pancerni2_add():
	if manufacturer.has($Pancerni2/Resource2.text):
		manufacturer[$Pancerni2/Resource2.text] += int($Pancerni2/Value2.text)
	else :
		manufacturer[$Pancerni2/Resource2.text] = int($Pancerni2/Value2.text)
	$Pancerni2/Resource2.clear()
	$Pancerni2/Value2.clear()


func delete_children(node):
	for i in node.get_children():
		i.queue_free()




