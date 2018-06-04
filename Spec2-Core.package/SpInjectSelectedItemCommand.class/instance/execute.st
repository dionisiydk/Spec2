execution
execute

	(selection includesItem: newSelectedItem)
		ifTrue: [ selection deselectItem: newSelectedItem ]
		ifFalse: [ selection addNewItem: newSelectedItem ]