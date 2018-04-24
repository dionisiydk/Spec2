execution
readParametersFromContext: aDialogPresenter
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	super readParametersFromContext: aDialogPresenter.
	
	dialog := aDialogPresenter.
	(dialog hasResultFor: self class)	ifTrue: [ 
		result := dialog resultOptionFor: self class]