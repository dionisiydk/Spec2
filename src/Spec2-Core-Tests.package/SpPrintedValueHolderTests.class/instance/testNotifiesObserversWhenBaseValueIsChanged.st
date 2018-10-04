tests
testNotifiesObserversWhenBaseValueIsChanged
	| holder baseHolder changed |
	changed := false.
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedDo: [ changed := true ].

	baseHolder value: 20.
	self assert: baseHolder value equals: 20.
	
	self assert: changed