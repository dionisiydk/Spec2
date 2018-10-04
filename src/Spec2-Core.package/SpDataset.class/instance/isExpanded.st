testing
isExpanded
	^self isRoot 
		ifTrue: [ true ]
		ifFalse: [ parentItem isExpanded ]