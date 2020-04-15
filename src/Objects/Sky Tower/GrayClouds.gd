extends StaticBody2D

onready var turn_on = true

func _on_OnScreen_timeout():
	if !turn_on:
		show()
		$C1.disabled = false
		$C2.disabled = false
		$C3.disabled = false
		$C4.disabled = false
		$C5.disabled = false
		$C6.disabled = false
		$C7.disabled = false
		$C8.disabled = false
		$C9.disabled = false
		$C10.disabled = false
		$C11.disabled = false
		$C12.disabled = false
		$C13.disabled = false
		$C14.disabled = false
		$C15.disabled = false
		$C16.disabled = false
		$C17.disabled = false
		$C18.disabled = false
		$C19.disabled = false
		$C20.disabled = false
		$C21.disabled = false
		$C22.disabled = false
		$C23.disabled = false
		$C24.disabled = false
		$C25.disabled = false
		$C26.disabled = false
		$C27.disabled = false
		turn_on = !turn_on
	else:
		turn_on = !turn_on

func _on_Change_timeout():
	if !turn_on:
		hide()
		$C1.disabled = true
		$C2.disabled = true
		$C3.disabled = true
		$C4.disabled = true
		$C5.disabled = true
		$C6.disabled = true
		$C7.disabled = true
		$C8.disabled = true
		$C9.disabled = true
		$C10.disabled = true
		$C11.disabled = true
		$C12.disabled = true
		$C13.disabled = true
		$C14.disabled = true
		$C15.disabled = true
		$C16.disabled = true
		$C17.disabled = true
		$C18.disabled = true
		$C19.disabled = true
		$C20.disabled = true
		$C21.disabled = true
		$C22.disabled = true
		$C23.disabled = true
		$C24.disabled = true
		$C25.disabled = true
		$C26.disabled = true
		$C27.disabled = true
