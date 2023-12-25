extends Node

class_name UnitBase

#Unit Stats
@export var damage: int
@export var max_hp: int
@export var armour: int
@export var resist: int
@export var initiative: int
@export var attack_type: String
@export var proc_chance: int
@export var ranged: bool
@export var targets_number: int
@export var level: int

#Misc

var unit_name: String
var slot_position: int
var current_hp: int
