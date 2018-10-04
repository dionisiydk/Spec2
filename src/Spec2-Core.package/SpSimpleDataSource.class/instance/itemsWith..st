queries
itemsWith: actualObjects
	| index |
	^actualObjects collect: [ :each | 
		index := items findFirst: [:existing | existing actualItem = each].
		index = 0 ifTrue: [ nil ] ifFalse: [ self itemAt: index ]]