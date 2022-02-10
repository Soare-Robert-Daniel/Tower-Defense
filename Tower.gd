extends Spatial

class_name Tower

enum TowerType { BASIC }

export (PackedScene) var projectile_scene = preload("res://Projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_projectile(projectileType = Projectile.ProjectileType.SIMPLE):
	var projectile = projectile_scene.instance()
	$FirePoint.add_child(projectile)

func load_tower_mesh(type):
	match type:
		TowerType.BASIC:
			$MeshInstance.mesh = CapsuleMesh.new()
			$MeshInstance.translate(Vector3(0, 1, 0))
			$MeshInstance.scale = Vector3(0.8, 0.8, 0.8)
			$MeshInstance.rotate_x(PI / 2.0)
