extends KinematicBody

class_name Projectile

enum ProjectileType { SIMPLE, MAGIC }

signal target_hit

export var isFired := false
export var speed := 3.0

var targetPosition: Vector3
var velocity := Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func initialize(projectileType = ProjectileType.SIMPLE):
	match projectileType:
		ProjectileType.SIMPLE:
			pass
		ProjectileType.MAGIC:
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	if isFired:
		var dir = (targetPosition - translation).normalized()
		velocity = dir * speed;
		move_and_slide(velocity)
		for index in get_slide_count():
			var collision = get_slide_collision(index)
			if collision:
				stop()
		

func fire():
	isFired = true
	
func stop():
	isFired = false
	emit_signal("target_hit")
