operations
toggleItems: singleItemArray inSelectionModel: aValueHolder
	"For this strategy given items should include single element.
	And this method will set it as given model value or reset existing value to nil"
	
	| newValue |
	newValue := aValueHolder value = singleItemArray first 
		ifTrue: [ nil ]
		ifFalse: [ singleItemArray first ].
	aValueHolder value: newValue