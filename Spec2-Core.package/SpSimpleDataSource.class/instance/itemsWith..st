queries
itemsWith: actualObjects
	| index |
	^actualObjects collect: [ :each | 
		index := items indexOf: each.
		index = 0 ifTrue: [ nil ] ifFalse: [ self itemAt: index ]]