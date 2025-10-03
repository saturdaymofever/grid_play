extends Node

# Ici on preload les scenes du player et du monstre, nous en auront besoin
var player_scene = preload("res://scenes/player.tscn")
var monster_scene = preload("res://scenes/monster.tscn")

# Déclaration des variables qui recevront les instances plus haut,
# on leur à declarer leur types, dans chaque scene nous avons un class_name 
var player:Player
var monster:Monster

# nous comptons le nombre de monstre tué
var monster_defeated:int = 0
# nous fixons l'objectif pour gagner le jeu (state WIN)
const win_objectif = 3

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
	if monster.pv <= 0:
		monster_defeated += 1
		if monster_defeated == win_objectif:
			current_state = State.WIN
		else:
			current_state = State.EXPLORATION

# ici on instantie et declare les variables de départ
func _ready() -> void:
	current_state = State.EXPLORATION
	player = player_scene.instantiate()
	monster = monster_scene.instantiate()


func _process(delta: float) -> void:
	pass
