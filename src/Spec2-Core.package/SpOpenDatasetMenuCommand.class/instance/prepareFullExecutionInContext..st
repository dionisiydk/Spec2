execution
prepareFullExecutionInContext: aDatasetContext
	super prepareFullExecutionInContext: aDatasetContext.
	
	datasetPresenter := aDatasetContext tool.
	targetItems := aDatasetContext selectedItems