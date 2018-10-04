controlling
resetStyle
	currentStyle = mainStyle ifTrue: [ ^self ].
	
	self applyStyle: mainStyle