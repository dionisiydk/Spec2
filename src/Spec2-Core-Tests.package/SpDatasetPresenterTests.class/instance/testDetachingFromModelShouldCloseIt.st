tests
testDetachingFromModelShouldCloseIt
	
	| dataSource |
	dataSource := SpDataSourceForTest on: #(1 2 3).
	presenter model: dataSource.
	
	presenter detachFromModel.
	
	self assert: dataSource wasClosed