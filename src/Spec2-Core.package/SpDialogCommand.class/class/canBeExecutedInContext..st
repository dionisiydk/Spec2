testing
canBeExecutedInContext: aPresenterContext
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	(super canBeExecutedInContext: aPresenterContext) ifFalse: [ ^false ].
	
	^aPresenterContext tool hasResultFor: self