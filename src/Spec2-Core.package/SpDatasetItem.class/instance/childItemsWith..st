accessing
childItemsWith: actualObjects
	childrenDataset ifNil: [ ^#() ].
	
	^childrenDataset itemsWith: actualObjects