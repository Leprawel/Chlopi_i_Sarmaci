extends Node2D


var resource = {}
var manufacturer = {}
var last_resource_add = 0
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


func resource_save():
	var file = File.new()
	var json = JSON.print(resource)
	file.open("user://resource.dat",File.WRITE)
	file.store_string (json)
	file.close()
	#print (json)

func timeset_save():
	var timeset = File.new()
	timeset.open("user://time_carriage.dat",File.WRITE)
	timeset.store_var (last_resource_add)
	timeset.close()

func manufacture_save():
	var file1 = File.new()
	var json1 = JSON.print(manufacturer)
	file1.open("user://manufacture.dat",File.WRITE)
	file1.store_string (json1)
	file1.close()
	#print(json1)

func _load():
	var check = File.new()
	if check.file_exists("user://resource.dat") \
	and check.file_exists("user://manufacture.dat") \
	and check.file_exists("user://time_carriage.dat"):
		var file = File.new()
		var timeset = File.new()
		var file1 = File.new()
		file.open("user://resource.dat", File.READ)
		timeset.open("user://time_carriage.dat", File.READ)
		file1.open("user://manufacture.dat", File.READ)
		var content = file.get_as_text()
		var content1 = file1.get_as_text()
		last_resource_add = timeset.get_var()
		file.close()
		file1.close()
		timeset.close()
		var jsonparse = JSON.parse(content)
		var jsonparse1 = JSON.parse(content1)
		print(last_resource_add)
#		print(jsonparse1.result)
		resource = jsonparse.result 
		manufacturer = jsonparse1.result

func get_sobota():
	var czasomierz = OS.get_datetime()
	var to_sob
	var to_sob_OS=0
	
	print (OS.get_datetime())
	czasomierz["weekday"]
	if czasomierz["weekday"] < 6:
		to_sob = czasomierz["weekday"] +1
		to_sob_OS = to_sob * 86400
	elif czasomierz["weekday"] > 6:
		to_sob_OS = 86400
	
	last_resource_add -=to_sob_OS
	
	print (OS.get_datetime_from_unix_time (last_resource_add))
	
	



func _ready():
	$Menu.hide()
	$Pancerni.hide()
	$Pancerni2.hide()
	$Resource.hide()
	$Lista.hide()
	$Lista1.hide()
	$Arrow.hide()
	last_resource_add = OS.get_unix_time()
	get_sobota()
	timeset_save()
	_load()



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
	_load()
	$Menu.hide()
	$Lista.show()
	$Lista1.show()
	$Resource.show()
	$Arrow.show()
	$Resource.position.y = 0
	$Lista.position.y = 200
	$Lista1.position.y = 200
	var new_date = OS.get_unix_time()
	while new_date - last_resource_add >= 20:
		for item in resource:
			if manufacturer.has(item):
				resource[item] += manufacturer[item]
		last_resource_add += 20
	var n = 0
	var m = 0
	for i in resource.keys():
		var newElement = elem.instance()
		newElement.setText(i,resource[i])
		newElement.position = Vector2(0,n*120)
		$Lista.add_child(newElement)
		n += 1
	for i in resource.keys():
		var newElement2 = elem2.instance()
		newElement2.setText2(i,manufacturer[i])
		newElement2.position = Vector2(0,m*120)
		$Lista1.add_child(newElement2)
		m += 1
	resource_save()
	timeset_save()


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



func Resource_add(): 
	if resource.has($Pancerni/Resource.text):
		resource[$Pancerni/Resource.text] += int($Pancerni/Value.text)
	else :
		resource[$Pancerni/Resource.text] = int($Pancerni/Value.text)
	if not manufacturer.has($Pancerni/Resource.text):
		manufacturer[$Pancerni/Resource.text] = 0
	$Pancerni/Resource.clear()
	$Pancerni/Value.clear()
	resource_save()
	manufacture_save()
	print(resource)
	print(manufacturer)


func Manufacture_add():
	if manufacturer.has($Pancerni2/Resource2.text):
		manufacturer[$Pancerni2/Resource2.text] += int($Pancerni2/Value2.text)
	else :
		manufacturer[$Pancerni2/Resource2.text] = int($Pancerni2/Value2.text)
	if not resource.has($Pancerni2/Resource2.text):
		resource[$Pancerni2/Resource2.text] = 0
	$Pancerni2/Resource2.clear()
	$Pancerni2/Value2.clear()
	resource_save()
	manufacture_save()
	print(resource)
	print(manufacturer)


func delete_children(node):
	for i in node.get_children():
		i.queue_free()





