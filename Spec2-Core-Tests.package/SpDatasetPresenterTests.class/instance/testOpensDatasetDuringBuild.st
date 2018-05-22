tests
testOpensDatasetDuringBuild
	
	| dataSource |
	dataSource := SpDataSourceForTest on: #(1 2 3).
	
	presenter := SpDatasetPresenter on: dataSource.
	self deny: dataSource wasOpened.
	
	presenter buildIn: ui.
	self assert: dataSource wasOpened
	