tests
testUnsubscribesFromBaseValueWhenNoObserverExistAnymore
	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedSend: #logCr to: self. "holder is in sync with base holder only when there is subscription".

	self assert: (baseHolder announcer hasSubscriber: holder).

	holder unsubscribe: self.	
	self deny: (baseHolder announcer hasSubscriber: holder).