extends StaticBody

class_name Cell

export (PackedScene) var tower_scene = preload("res://Tower.tscn")
export (PackedScene) var enemy_scene = preload("res://Enemy.tscn")

enum CellType { PATH, TOWER, AMBIENTAL, START, END}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func initialize(starting_positon: Vector3 = Vector3.ZERO, cellType = CellType.AMBIENTAL, towerType = Tower.TowerType.BASIC, projectileType = Projectile.ProjectileType.SIMPLE):
	translation = starting_positon
	match cellType:
		CellType.PATH:
			pass
		CellType.TOWER:
			add_tower(towerType, projectileType)
		CellType.START:
			pass # add_enemy()
		
	
func add_tower(towerType, projectileType):
	var tower = tower_scene.instance()
	tower.load_tower_mesh(towerType)
	tower.load_projectile(projectileType)
	$PlacePoint.add_child(tower)

func add_enemy():
	var enemy = enemy_scene.instance()
	$PlacePoint.add_child(enemy)
