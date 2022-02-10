extends Node

export var rows := 5
export var cols := 5

export (PackedScene) var cell_scene = preload("res://Cell.tscn")
export (PackedScene) var enemy_scene = preload("res://Enemy.tscn")

signal enemy_spawned(position)

var moduleDefinition = [
	[ Cell.CellType.AMBIENTAL, Cell.CellType.AMBIENTAL, Cell.CellType.START, Cell.CellType.AMBIENTAL, Cell.CellType.AMBIENTAL ],
	[ Cell.CellType.AMBIENTAL, Cell.CellType.TOWER, Cell.CellType.PATH, Cell.CellType.AMBIENTAL, Cell.CellType.AMBIENTAL ],
	[ Cell.CellType.AMBIENTAL, Cell.CellType.AMBIENTAL, Cell.CellType.PATH, Cell.CellType.AMBIENTAL, Cell.CellType.AMBIENTAL ],
	[ Cell.CellType.AMBIENTAL, Cell.CellType.AMBIENTAL, Cell.CellType.PATH, Cell.CellType.PATH, Cell.CellType.END ]
]

var pathCheckpoints = [
	Vector3(2, 0, 0) * 4,
	Vector3(2, 0, 3) * 4,
	Vector3(4, 0, 3) * 4,
]

# Called when the node enters the scene tree for the first time.
func _ready():
	cols = moduleDefinition[0].size()
	rows = moduleDefinition.size()
	for r in rows:
		for c in cols:
			var cell = cell_scene.instance()
			var position = $PlacingPoint.translation
			
			position += Vector3(c * 4, 0, r * 4)
			
			# TODO: move cell
			cell.initialize(position, moduleDefinition[r][c], Tower.TowerType.BASIC)
			$PlacingPoint.add_child(cell)
			
			print("Pos r: %s c: %s" % [r, c])
			print(cell.translation)
	spawn_enemy()
	
func spawn_enemy():
	var enemy = enemy_scene.instance()
	enemy.initialize(pathCheckpoints)
	$PlacingPoint.add_child(enemy)
	
	
