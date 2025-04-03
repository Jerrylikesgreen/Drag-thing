extends Node2D


@onready var Pot = $Pot
@export var recipe: Dictionary 





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is RigidBody2D:
		var custom_body := body as RigidBody2D
		var item = custom_body.item_resource
		if item is Item:
			Pot.inside_of_pot.append(item.item_name)
			if Pot.inside_of_pot.size() >= 3:
				Pot.inside_of_pot.clear()
			if Pot.inside_of_pot == recipe:
				print("Done did it!")
			print(item.item_name)
			print(Pot.inside_of_pot)
		else:
			print("The 'item_resource' is not an Item.")
	else:
		print("Entered body is NOT a RigidBody2D with 'item_resource'.")
