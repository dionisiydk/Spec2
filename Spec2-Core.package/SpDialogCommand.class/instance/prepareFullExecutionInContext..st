execution
prepareFullExecutionInContext: aDialogPresenter
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	super prepareFullExecutionInContext: aDialogPresenter.
	
	dialog := aDialogPresenter