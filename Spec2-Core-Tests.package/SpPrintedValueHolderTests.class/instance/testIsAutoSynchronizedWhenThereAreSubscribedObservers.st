tests
testIsAutoSynchronizedWhenThereAreSubscribedObservers
	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedDo: [ "holder is in sync with base holder only when there are subscriptions"].

	baseHolder value: 20.
	self assert: baseHolder value equals: 20.

	self assert: holder value equals: '20'.
	