extends MeshInstance3D

@onready var tank:Node3D = $"../tank"
var to_player
var forw

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	to_player = tank.global_position - global_position
	to_player =to_player.normalized()
	forw = global_transform.basis.z
	DebugDraw3D.draw_arrow(global_position,global_position + forw * 5, Color.AQUA, 0.1)
	DebugDraw2D.set_text("Enemy To Player: ", to_player)
	DebugDraw2D.set_text("forward: ", forw)
	
	var axis = to_player.cross(forw)
	
	var theta = acos(to_player.dot(forw))
	
	
	DebugDraw2D.set_text("angle to player: ", rad_to_deg(theta))
	DebugDraw2D.set_text("axis: ", axis)
	
	rotation = Vector3(0,- theta,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass
