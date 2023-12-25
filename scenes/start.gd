extends CanvasLayer
signal battle_go
var next_slot = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(_delta):
	if next_slot == 4:
		print("Slots are gone")
		Globals.pick_over = true
		next_slot += 1
		battle_go.emit()


func _on_archer_pick_pressed():
	pick('Archer',next_slot)
	next_slot += 1

func _on_warriror_pick_pressed():
	pick('Warrior', next_slot)
	next_slot += 1


func _on_wizard_pick_pressed():
	pick('Wizard', next_slot)
	next_slot += 1

func pick(type, slot):
	match type:
		"Archer":
			match slot:
				1:
					UnitStats.dmg1 = Archer.damage
					UnitStats.hp1 = Archer.max_hp
					UnitStats.armour1 = Archer.armour
					UnitStats.resist1 = Archer.resist
					UnitStats.attack_type1 = Archer.attack_type
					UnitStats.proc_chance1 = Archer.proc_chance
					UnitStats.ranged1 = Archer.ranged
					UnitStats.targets_number1 = Archer.targets_number
					UnitStats.ini1 = Archer.initiative
					UnitStats.type1 = Archer.unit_name
				2:
					UnitStats.dmg2 = Archer.damage
					UnitStats.hp2 = Archer.max_hp
					UnitStats.armour2 = Archer.armour
					UnitStats.resist2 = Archer.resist
					UnitStats.attack_type2 = Archer.attack_type
					UnitStats.proc_chance2 = Archer.proc_chance
					UnitStats.ranged2 = Archer.ranged
					UnitStats.targets_number2 = Archer.targets_number
					UnitStats.ini2 = Archer.initiative
					UnitStats.type2 = Archer.unit_name
				3:
					UnitStats.dmg3 = Archer.damage
					UnitStats.hp3 = Archer.max_hp
					UnitStats.armour3 = Archer.armour
					UnitStats.resist3 = Archer.resist
					UnitStats.attack_type3 = Archer.attack_type
					UnitStats.proc_chance3 = Archer.proc_chance
					UnitStats.ranged3 = Archer.ranged
					UnitStats.targets_number3 = Archer.targets_number
					UnitStats.ini3 = Archer.initiative
					UnitStats.type3 = Archer.unit_name
					
		"Warrior":
			match slot:
				1:
					UnitStats.dmg1 = Warrior.damage
					UnitStats.hp1 = Warrior.max_hp
					UnitStats.armour1 = Warrior.armour
					UnitStats.resist1 = Warrior.resist
					UnitStats.attack_type1 = Warrior.attack_type
					UnitStats.proc_chance1 = Warrior.proc_chance
					UnitStats.ranged1 = Warrior.ranged
					UnitStats.targets_number1 = Warrior.targets_number
					UnitStats.ini1 = Warrior.initiative
					UnitStats.type1 = Warrior.unit_name
				2:
					UnitStats.dmg2 = Warrior.damage
					UnitStats.hp2 = Warrior.max_hp
					UnitStats.armour2 = Warrior.armour
					UnitStats.resist2 = Warrior.resist
					UnitStats.attack_type2 = Warrior.attack_type
					UnitStats.proc_chance2 = Warrior.proc_chance
					UnitStats.ranged2 = Warrior.ranged
					UnitStats.targets_number2 = Warrior.targets_number
					UnitStats.ini2 = Warrior.initiative
					UnitStats.type2 = Warrior.unit_name
				3:
					UnitStats.dmg3 = Warrior.damage
					UnitStats.hp3 = Warrior.max_hp
					UnitStats.armour3 = Warrior.armour
					UnitStats.resist3 = Warrior.resist
					UnitStats.attack_type3 = Warrior.attack_type
					UnitStats.proc_chance3 = Warrior.proc_chance
					UnitStats.ranged3 = Warrior.ranged
					UnitStats.targets_number3 = Warrior.targets_number
					UnitStats.ini3 = Warrior.initiative
					UnitStats.type3 = Warrior.unit_name
					
		"Wizard":
			match slot:
				1:
					UnitStats.dmg1 = Wizard.damage
					UnitStats.hp1 = Wizard.max_hp
					UnitStats.armour1 = Wizard.armour
					UnitStats.resist1 = Wizard.resist
					UnitStats.attack_type1 = Wizard.attack_type
					UnitStats.proc_chance1 = Wizard.proc_chance
					UnitStats.ranged1 = Wizard.ranged
					UnitStats.targets_number1 = Wizard.targets_number
					UnitStats.ini1 = Wizard.initiative
					UnitStats.type1 = Wizard.unit_name
				2:
					UnitStats.dmg2 = Wizard.damage
					UnitStats.hp2 = Wizard.max_hp
					UnitStats.armour2 = Wizard.armour
					UnitStats.resist2 = Wizard.resist
					UnitStats.attack_type2 = Wizard.attack_type
					UnitStats.proc_chance2 = Wizard.proc_chance
					UnitStats.ranged2 = Wizard.ranged
					UnitStats.targets_number2 = Wizard.targets_number
					UnitStats.ini2 = Wizard.initiative
					UnitStats.type2 = Wizard.unit_name
				3:
					UnitStats.dmg3 = Wizard.damage
					UnitStats.hp3 = Wizard.max_hp
					UnitStats.armour3 = Wizard.armour
					UnitStats.resist3 = Wizard.resist
					UnitStats.attack_type3 = Wizard.attack_type
					UnitStats.proc_chance3 = Wizard.proc_chance
					UnitStats.ranged3 = Wizard.ranged
					UnitStats.targets_number3 = Wizard.targets_number
					UnitStats.ini3 = Wizard.initiative
					UnitStats.type3 = Wizard.unit_name
	
			
