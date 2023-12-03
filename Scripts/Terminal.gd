extends Node

@export var answer: Label
@export var example: Label

var expression = Expression.new()
var formula: String
var cleared: bool

func enter(symbol):
	if cleared:
		clear()
	formula += symbol
	example.text += symbol

func clear() -> void:
	formula = ""
	example.text = ""
	answer.text = "0"
	cleared = false

func calculation() -> void:
	cleared = true
	var error = expression.parse(formula)
	if error != OK:
		answer.text = expression.get_error_text()
		return
	answer.text = str(expression.execute())
