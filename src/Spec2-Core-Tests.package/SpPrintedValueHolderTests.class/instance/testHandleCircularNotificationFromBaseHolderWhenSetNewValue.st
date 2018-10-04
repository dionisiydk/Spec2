tests
testHandleCircularNotificationFromBaseHolderWhenSetNewValue
	| holder baseHolder count |
	count := 0.
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedDo: [ count := count + 1 ].
	count := 0. "to reset initial synchronization during first subscription"
	
	holder value: '10'.
	
	self assert: count equals: 1