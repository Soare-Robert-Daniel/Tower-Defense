extends KinematicBody

export var speed := 2.0

var velocity := Vector3.ZERO
var checkpoints : Array = []
var checkpointIndex := 0
var direction := Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func initialize(path):
	checkpoints = path
	direction = (checkpoints[checkpointIndex] as Vector3 - translation).normalized()
	velocity = direction * speed;
	
func _physics_process(delta):
	# TODO: refactor this verification
	if checkpointIndex < checkpoints.size():
		var dist = translation.distance_to(checkpoints[checkpointIndex])
		print(dist)
		if dist - speed * delta < 0.2:
			
			translation = Vector3(checkpoints[checkpointIndex].x, translation.y, checkpoints[checkpointIndex].z)
			checkpointIndex += 1
			
			if checkpointIndex >= checkpoints.size():
				return
				
			direction = (checkpoints[checkpointIndex] as Vector3 - translation).normalized()
			velocity = direction * speed;

		move_and_slide(velocity)

	
