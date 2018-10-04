comparing
= anObject
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ option1 = anObject option1 and: [ option2 = anObject option2 ]