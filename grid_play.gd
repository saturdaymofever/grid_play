extends Node

#test
# Ici on preload les scenes du player et du monstre, nous en auront besoin
var player_scene:PackedScene = preload("res://scenes/player.tscn")
var monster_scene:PackedScene = preload("res://scenes/monster.tscn")

#AJOUT MORGAN
var level_exploration_scene:PackedScene = preload("res://scenes/level_exploration.tscn")
var level_fight_scene:PackedScene = preload("res://scenes/level_fight.tscn"
)
var level_exploration_instantiated:bool = false
var level_fight_instantiated:bool = false

var monster_fight_coord:Vector2 = Vector2(1117, 531)
var player_fight_coord:Vector2 = Vector2(427, 531)

# Déclaration des variables qui recevront les instances plus haut,
# on leur à declarer leur types, dans chaque scene nous avons un class_name 
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
	if monster.pv <= 0:
		monster_defeated += 1
		if monster_defeated == win_objectif:
			current_state = State.WIN
		else:
			current_state = State.EXPLORATION
			
	
func check_if_fight_is_instantiated():
	if level_fight_instantiated == false:
		instantiate_fight_level()
		level_fight_instantiated = true
	
	
func instantiate_fight_level():
	var level_fight = level_fight_scene.instantiate()
	add_child(level_fight)
	

# ici on instantie et declare les variables de départ
func _ready() -> void:
	current_state = State.FIGHT
	player = player_scene.instantiate()
	monster = monster_scene.instantiate()
	process_exploration_turn()
	add_child(player)
	add_child(monster)

func _process(delta: float) -> void:
	if current_state == State.EXPLORATION:
		check_if_level_exploration_is_instantiated()
	if current_state == State.FIGHT:
		check_if_fight_is_instantiated()

func check_if_level_exploration_is_instantiated():
	if level_exploration_instantiated == false:
		instantiate_level_exploration()
		level_exploration_instantiated = true

func instantiate_level_exploration():
	var level_exploration = level_exploration_scene.instantiate()
	level_exploration.exploration_turn.connect(process_exploration_turn)
	level_exploration.set_player(player)
	level_exploration.set_monster(monster)
	add_child(level_exploration)
