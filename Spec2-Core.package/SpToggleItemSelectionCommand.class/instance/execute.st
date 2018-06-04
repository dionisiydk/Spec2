execution
execute

	(selection includesItem: targetItem)
		ifTrue: [ selection reset ]
		ifFalse: [ selection setNewItems: {targetItem} ]