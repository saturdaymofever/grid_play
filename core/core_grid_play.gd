class_name CoreGridPlay

var player_scene:PackedScene = preload("res://scenes/player.tscn")
var monster_scene:PackedScene = preload("res://scenes/monster.tscn")

var player:Player
var monster:Monster



# nous comptons le nombre de monstre tué
var monster_defeated:int = 0
# nous fixons l'objectif pour gagner le jeu (state WIN)
const win_objectif:int = 3

# Nous definissons ici la taille de la grille, il s'agit d'une constante
const grid_size:Vector2 = Vector2(3, 3)
# Nous définissons une variable pour l'etat actuel du jeu en lien avec enum plus bas
var current_state:State
# Un enum des états
enum State {
	EXPLORATION,
	FIGHT,
	WIN,
	GAME_OVER
}

# la fonction exploration 
func process_exploration_turn():
	player.new_rand_coord(grid_size)
	monster.new_rand_coord(grid_size)
	if player.coord == monster.coord:
		current_state = State.FIGHT

# la fonction combat 
func process_fight_turn():
	monster.take_damage(player.power)
	player.take_damage(monster.power)
	if player.pv <= 0:
		current_state = State.GAME_OVER
	elif monster.pv <= 0:
		monster_defeated += 1
		if monster_defeated == win_objectif:
			current_state = State.WIN
		else:
			monster_renew()
			current_state = State.EXPLORATION

func _init():
	current_state = State.EXPLORATION
	player = player_scene.instantiate()
	monster = monster_scene.instantiate()
	process_exploration_turn()

func monster_renew():
	monster.pv = 10
