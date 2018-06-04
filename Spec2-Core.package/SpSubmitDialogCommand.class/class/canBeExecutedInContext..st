testing
canBeExecutedInContext: aPresenterPresenter
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	(super canBeExecutedInContext: aPresenterPresenter) ifFalse: [ ^false ].
	
	^aPresenterPresenter tool showsValidData