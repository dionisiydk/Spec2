queries
itemsWith: actualObjects
	| index |
	^actualObjects collect: [ :each | 
		index := actualItems indexOf: each.
		index = 0 ifTrue: [ nil ] ifFalse: [ self itemAt: index ]]