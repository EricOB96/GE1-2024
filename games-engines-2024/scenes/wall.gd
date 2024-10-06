extends Node3D

@export var brick_scene:PackedScene
@export var rows = 10
@export var cols = 10
@export var bricks_no: int = 10
@export var radius: float = 1.0
@export var height : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_tower()

	pass # Replace with function body.

func spawn_tower():
	for row in range(rows):
		for col in range(cols):
			var brick = brick_scene.instantiate()
			var pos = Vector3(col, row, 0)
			brick.position = pos
			
			var m = StandardMaterial3D.new()
			var h = ((row * cols) + col) / (float)(rows * cols)
			m.albedo_color = Color.from_hsv(h, 1, 1)
			var mesh:MeshInstance3D = brick.get_node("MeshInstance3D")
			mesh.set_surface_override_material(0, m)
			add_child(brick)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
