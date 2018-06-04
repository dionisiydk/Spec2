execution
execute

	(selection includesItem: newSelectedItem)
		ifTrue: [ selection reset ]
		ifFalse: [ selection setNewItems: {newSelectedItem} ]