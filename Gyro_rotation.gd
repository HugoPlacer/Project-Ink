extends ViewportContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func rotate_by_gyro(p_gyro, p_basis, p_delta):
	var rotate = Basis()

	rotate = rotate.rotated(p_basis.x, -p_gyro.x * p_delta)
	rotate = rotate.rotated(p_basis.y, -p_gyro.y * p_delta)
	rotate = rotate.rotated(p_basis.z, -p_gyro.z * p_delta)

	return rotate * p_basis
	
func drift_correction(p_basis, p_grav):
	# as always, make sure our vector is normalized but also invert as our gravity points down
	var real_up = -p_grav.normalized()

	# start by calculating the dot product, this gives us the cosine angle between our two vectors
	var dot = p_basis.y.dot(real_up)

	# if our dot is 1.0 we're good
	if dot < 1.0:
		# the cross between our two vectors gives us a vector perpendicular to our two vectors
		var axis = p_basis.y.cross(real_up).normalized()
		var correction = Basis(axis, acos(dot))
		p_basis = correction * p_basis

	return p_basis
	
func _process(delta):
	# Get our data
	var grav = Input.get_gravity()
	var gyro = Input.get_gyroscope()
	var activated = bool()
	
	var gyro_and_grav = get_node("Viewport/bluepen")
	var new_basis = rotate_by_gyro(gyro, gyro_and_grav.transform.basis, delta).orthonormalized()
	var giro = gyro_and_grav.transform.basis
	
	#gyro_and_grav.transform.basis = (drift_correction(new_basis, grav))
	
	var Animationode = $Viewport/Rotation
	Animationode.play("rotation_test")
		
		
	
	

