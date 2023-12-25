extends Control

signal battle_over
var archer_text = preload("res://graphics/archer.png")
var war_text = preload("res://graphics/warrior.png")
var wiz_text = preload("res://graphics/wizard.png")
var player_targets = [1,2]
var enemy_targets = [1,2,3]
var new_turn = false
var player_turn = true
var slot1_a: bool = false
var slot2_a: bool = false
var slot3_a: bool = false
var slot1_ae:bool = false
var slot2_ae:bool = false
var enemy1_hp: int = 10
var enemy1_dmg: int = 10
var enemy2_hp: int = 10
var enemy2_dmg: int = 10
var dead_all_enemies: bool = false
var dead_all_allies: bool = false
var slot1alive = false
var slot2alive = false
var slot3alive = false
var slot1alive_enemy = false
var slot2alive_enemy = false
var dead_ally_count: int = 0
var dead_enemy_count: int = 0 
func _ready():
	pass

func _process(delta):
	match UnitStats.type1:
		"Archer":
			$Slot1.texture = archer_text
		"Warrior":
			$Slot1.texture = war_text
		"Wizard":
			$Slot1.texture = wiz_text
	match UnitStats.type2:
		"Archer":
			$Slot2.texture = archer_text
		"Warrior":
			$Slot2.texture = war_text
		"Wizard":
			$Slot2.texture = wiz_text	
	match UnitStats.type3:
		"Archer":
			$Slot3.texture = archer_text
		"Warrior":
			$Slot3.texture = war_text
		"Wizard":
			$Slot3.texture = wiz_text
	while Globals.ongoing_battle == true:
			battle()

func battle():
	if not slot1_a and player_turn:
		if not slot1alive:
			hit(UnitStats.dmg1, UnitStats.type1)
		else:
			slot1_a = true
	if not slot2_a and player_turn:
		if not slot2alive:
			hit(UnitStats.dmg2, UnitStats.type2)
		else:
			slot2_a = true
	if not slot3_a and player_turn:
		if not slot3alive:
			hit(UnitStats.dmg3, UnitStats.type3)
		else:
			slot3_a = true
	if not slot1_ae and not player_turn:
		if not slot1alive_enemy:
			hit_enemy(enemy1_dmg)
		else:
			slot1_ae = true
	if not slot2_ae and not player_turn:
		if not slot2alive_enemy:
			hit_enemy(enemy2_dmg)
		else:
			slot2_ae = true
			
			
			if slot1alive == true and slot2alive == true and slot3alive == true:
				dead_all_allies = true
			if slot1alive_enemy == true and slot2alive_enemy == true:
				dead_all_enemies = true
			if slot1_a and slot2_a and slot3_a:
				slot1_a = false
				slot2_a = false
				slot3_a = false
			if slot1_ae and slot2_ae:
				slot1_ae = false
				slot2_ae = false
			if dead_all_enemies or dead_all_allies:
				print ("battle over")
				Globals.ongoing_battle = false



func hit(unit_dmg, unit_type):
		if slot1alive_enemy:
			player_targets.erase(1)
		if slot2alive_enemy:
			player_targets.erase(2)
		var choose_target = player_targets[randi() % player_targets.size()]
		if choose_target == 1:
			enemy1_hp -= unit_dmg
			print(unit_type + " attacks! Orc 1 has " + str(enemy1_hp) + "hp!")
			if enemy1_hp <= 0:
				dead_enemy_count += 1
				slot1alive_enemy = true
			slot1_a = true
			player_turn = false
		elif choose_target == 2:
			enemy2_hp -= unit_dmg
			print(unit_type + " attacks! Orc 2 has " + str(enemy2_hp) + "hp!")
			if enemy2_hp <= 0:
				dead_enemy_count += 1
				slot2alive_enemy = true
			slot1_a = true
			player_turn = false
func hit_enemy(enemy_dmg):
					if slot1alive:
						enemy_targets.erase(1)
					if slot2alive:
						enemy_targets.erase(2)
					if slot3alive:
						enemy_targets.erase(3)
					var choose_target = enemy_targets[randi() % enemy_targets.size()]
					match choose_target:
						1:
							UnitStats.hp1 -= enemy_dmg
							print(UnitStats.type1 + " has " + str(UnitStats.hp1))
							if UnitStats.hp1 <=0:
								dead_ally_count += 1
								slot1alive = true
							slot1_ae = true
							player_turn = true
						2:
							UnitStats.hp2 -= enemy_dmg
							print(UnitStats.type2 + " has " + str(UnitStats.hp2))
							if UnitStats.hp2 <=0:
								slot2alive = true
								dead_ally_count += 1
							slot1_ae = true
							player_turn = true
						3:
							UnitStats.hp3 -= enemy_dmg
							print(UnitStats.type3 + " has " + str(UnitStats.hp3))
							if UnitStats.hp3 <=0:
								dead_ally_count += 1
								slot3alive = true
							slot1_ae = true
							player_turn = true

func attack_animation(slot):
	await get_tree().create_timer(1).timeout
	var tween = create_tween()
	tween.tween_property(slot, "position:x",90 , 0.5)
	await get_tree().create_timer(0.1).timeout
	var tween2 = create_tween()
	tween2.tween_property(slot, "position:x",38 , 0.5)

