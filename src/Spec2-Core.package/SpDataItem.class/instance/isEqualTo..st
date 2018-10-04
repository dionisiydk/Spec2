testing
isEqualTo: aDataItem 
	self = aDataItem ifTrue: [ ^true ].
	
	^actualItem = aDataItem actualItem