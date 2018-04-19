tests
testAddButtonItemsByDefault
	
	| item |
	item := presenter children anyOne.
	
	self assert: item class equals: SpCommandPresenter