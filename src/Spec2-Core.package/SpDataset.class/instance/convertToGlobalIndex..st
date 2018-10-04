converting
convertToGlobalIndex: dataSourceIndex

	| result |
	result := parentItem ifNil: [ 0 ] ifNotNil: [ parentItem globalIndex ].
	expandedItems do: [ :each | 
		(each dataSourceIndex >= dataSourceIndex) ifTrue: [
			^result + dataSourceIndex].
		result := result + each childrenCount].
	
	^result + dataSourceIndex