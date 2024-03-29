extends Control

var max_hearts = 4:
	set(value):
		max_hearts = max(value, 1)
		heart_ui_empty.size.x = max_hearts * 15
var hearts = max_hearts:
	set = set_hearts

@onready var heart_ui_full = $HeartUIFull
@onready var heart_ui_empty = $HeartUIEmpty


func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	heart_ui_full.size.x = hearts * 15


func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health

	PlayerStats.health_changed.connect(set_hearts)

func game_over():
	# Ganti scene ke halaman game over
	get_tree().change_scene("res://game_over.tscn")
	# Atau tampilkan UI game over, sesuaikan dengan kebutuhan Anda
	# Jangan lupa untuk menangani input atau tombol kembali untuk kembali ke menu utama, misalnya:
	# Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
