accessing
childrenCount

	childrenDataset ifNil: [ ^0 ].
	
	^childrenDataset itemCount