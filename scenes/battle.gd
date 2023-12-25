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

func _on_visibility_changed():
	match UnitStats.type1:
		"Archer":
			$Control/Slot1.texture = archer_text
		"Warrior":
			$Control/Slot1.texture = war_text
		"Wizard":
			$Control/Slot1.texture = wiz_text
	match UnitStats.type2:
		"Archer":
			$Control/Slot2.texture = archer_text
		"Warrior":
			$Control/Slot2.texture = war_text
		"Wizard":
			$Control/Slot2.texture = wiz_text	
	match UnitStats.type3:
		"Archer":
			$Control/Slot3.texture = archer_text
		"Warrior":
			$Control/Slot3.texture = war_text
		"Wizard":
			$Control/Slot3.texture = wiz_text
	while Globals.ongoing_battle == true:
			while dead_all_enemies == false and dead_all_allies == false:
				battle()
				$UI.visible = false
func _process(delta):
	pass

func battle():
			if not slot1_a and player_turn:
				if not slot1alive:
					if slot1alive_enemy:
						player_targets.erase(1)
					if slot2alive_enemy:
						player_targets.erase(2)
					var choose_target = player_targets[randi() % player_targets.size()]
					if choose_target == 1:
						enemy1_hp -= UnitStats.dmg1
						print(UnitStats.type1 + " attacks! Orc 1 has " + str(enemy1_hp) + "hp!")
						if enemy1_hp <= 0:
							dead_enemy_count += 1
							slot1alive_enemy = true
							if slot1alive_enemy and slot2alive_enemy:
								$".".hide()
						slot1_a = true
						player_turn = false
					elif choose_target == 2:
						enemy2_hp -= UnitStats.dmg1
						print(UnitStats.type1 + " attacks! Orc 2 has " + str(enemy2_hp) + "hp!")
						if enemy2_hp <= 0:
							dead_enemy_count += 1
							slot2alive_enemy = true
							if slot1alive_enemy and slot2alive_enemy:
								$".".hide()
						slot1_a = true
						player_turn = false
				else:
					slot1_a = true
			if not slot2_a and player_turn:
				if not slot2alive:
					if slot1alive_enemy:
						player_targets.erase(1)
					if slot2alive_enemy:
						player_targets.erase(2)
					var choose_target = player_targets[randi() % player_targets.size()]
					if choose_target == 1:
						enemy1_hp -= UnitStats.dmg2
						print(UnitStats.type2 + " attacks! Orc 1 has " + str(enemy1_hp) + "hp!")
						if enemy1_hp <= 0:
							slot1alive_enemy = true
							dead_enemy_count += 1
							if slot1alive_enemy and slot2alive_enemy:
								$".".hide()
						slot2_a = true
						player_turn = false
					elif choose_target == 2 or slot1alive_enemy:
						enemy2_hp -= UnitStats.dmg2
						print(UnitStats.type2 + " attacks! Orc 2 has " + str(enemy2_hp) + "hp!")
						if enemy2_hp <= 0:
							slot2alive_enemy = true
							dead_enemy_count += 1
							if slot1alive_enemy and slot2alive_enemy:
								$".".hide()
						slot2_a = true
						player_turn = false
				else:
					slot2_a = true
			if not slot3_a and player_turn:
				if not slot3alive:
					if slot1alive_enemy:
						player_targets.erase(1)
					if slot2alive_enemy:
						player_targets.erase(2)
					var choose_target = player_targets[randi() % player_targets.size()]
					if choose_target == 1:
						enemy1_hp -= UnitStats.dmg3
						print(UnitStats.type3 + " attacks! Orc 1 has " + str(enemy1_hp) + "hp!")
						if enemy1_hp <= 0:
							slot1alive_enemy = true
							if slot1alive_enemy and slot2alive_enemy:
								$".".hide()
							dead_enemy_count += 1
						slot3_a = true
						player_turn = false
					elif choose_target == 2:
						enemy2_hp -= UnitStats.dmg3
						print(UnitStats.type3 + " attacks! Orc 2 has " + str(enemy2_hp) + "hp!")
						if enemy2_hp <= 0:
							dead_enemy_count += 1
							slot2alive_enemy = true
							if slot1alive_enemy and slot2alive_enemy:
								$".".hide()
						slot3_a = true
						player_turn = false
				else:
					slot3_a = true
			if not slot1_ae and not player_turn:
				if not slot1alive_enemy:
					if slot1alive:
						enemy_targets.erase(1)
					if slot2alive:
						enemy_targets.erase(2)
					if slot3alive:
						enemy_targets.erase(3)
					var choose_target = enemy_targets[randi() % enemy_targets.size()]
					match choose_target:
						1:
							UnitStats.hp1 -= enemy1_dmg
							print(UnitStats.type1 + " has " + str(UnitStats.hp1))
							if UnitStats.hp1 <=0:
								dead_ally_count += 1
								slot1alive = true
								if slot1alive and slot2alive:
									$".".hide()
							slot1_ae = true
							player_turn = true
						2:
							UnitStats.hp2 -= enemy1_dmg
							print(UnitStats.type2 + " has " + str(UnitStats.hp2))
							if UnitStats.hp2 <=0:
								slot2alive = true
								dead_ally_count += 1
								if slot1alive and slot2alive:
									$".".hide()
							slot1_ae = true
							player_turn = true
						3:
							UnitStats.hp3 -= enemy1_dmg
							print(UnitStats.type3 + " has " + str(UnitStats.hp3))
							if UnitStats.hp3 <=0:
								dead_ally_count += 1
								slot3alive = true
								if slot1alive and slot2alive:
									$".".hide()
							slot1_ae = true
							player_turn = true
				else:
					slot1_ae = true
			if not slot2_ae and not player_turn:
				if not slot2alive_enemy:
					if slot1alive:
						enemy_targets.erase(1)
					if slot2alive:
						enemy_targets.erase(2)
					if slot3alive:
						enemy_targets.erase(3)
					var choose_target = enemy_targets[randi() % enemy_targets.size()]
					match choose_target:
						1:
							UnitStats.hp1 -= enemy2_dmg
							print(UnitStats.type1 + " has " + str(UnitStats.hp1))
							if UnitStats.hp1 <=0:
								slot1alive = true
								dead_ally_count += 1
								if slot1alive and slot2alive:
									$".".hide()
							slot2_ae = true
							player_turn = true
						2:
							UnitStats.hp2 -= enemy2_dmg
							print(UnitStats.type2 + " has " + str(UnitStats.hp2))
							if UnitStats.hp2 <=0:
								slot2alive = true
								dead_ally_count += 1
								if slot1alive and slot2alive:
									$".".hide()
							slot2_ae = true
							player_turn = true
						3:
							UnitStats.hp3 -= enemy2_dmg
							print(UnitStats.type3 + " has " + str(UnitStats.hp3))
							if UnitStats.hp3 <=0:
								slot3alive = true
								dead_ally_count += 1
								if slot1alive and slot2alive:
									$".".hide()
							slot2_ae = true
							player_turn = true
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


func _on_texture_button_pressed():
	battle_over.emit()
