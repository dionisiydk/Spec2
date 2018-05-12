attached model
beSynchronizedWithActualModel: aValueHolder
	"We expect single value change when selection is single.
	And we expect list value change when selection is multiple"
	| newActualItems |
	newActualItems := isSingle 
		ifTrue: [ {aValueHolder value} ]
		ifFalse: [ aValueHolder value ].
		
	self selectItemsWith: newActualItems