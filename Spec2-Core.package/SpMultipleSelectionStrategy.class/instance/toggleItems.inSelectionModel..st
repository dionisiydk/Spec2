operations
toggleItems: selectedItemArray inSelectionModel: aListValueHolder
	"For this strategy given model should be list value.
	And this method will add or remove given selected items from it"
	
	| newValue itemsToKeep |
	itemsToKeep := aListValueHolder value copyWithoutAll: selectedItemArray.
	newValue := (aListValueHolder value includes: selectedItemArray last)
		ifTrue: [ itemsToKeep ]
		ifFalse: [ itemsToKeep , selectedItemArray ].
		
	aListValueHolder value: newValue