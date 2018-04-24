testing
canBeExecutedInContext: aDialogPresenter
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	(super canBeExecutedInContext: aDialogPresenter) ifFalse: [ ^false ].
	
	^aDialogPresenter hasResultFor: self