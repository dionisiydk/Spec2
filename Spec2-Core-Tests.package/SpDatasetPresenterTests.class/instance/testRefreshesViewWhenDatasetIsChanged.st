tests
testRefreshesViewWhenDatasetIsChanged
	
	| currentItems |
	currentItems := presenter view contents.
	
	model announceChanges. 
	
	self deny: presenter view contents = currentItems