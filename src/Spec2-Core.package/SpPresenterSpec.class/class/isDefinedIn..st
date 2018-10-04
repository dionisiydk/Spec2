testing
isDefinedIn: aMethod
	^self definingPragmas anySatisfy: [:each | 
		aMethod hasPragmaNamed: each]