actual model syncronization
synchronizeActualModel: aValueHolder
	"We expect single value model when selection is single.
	And we expect list value model when selection is multiple"
	
	| newValue |
	newValue := isSingle 
		ifTrue: [ self isEmpty ifTrue: [nil] ifFalse: [self lastItem actualItem] ]
		ifFalse: [ self actualItems ].

	aValueHolder value: newValue