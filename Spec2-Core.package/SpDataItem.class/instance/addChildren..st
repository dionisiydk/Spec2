accessing
addChildren: aDataItemChildren
	
	children removeAllSuchThat: [ :each | each name = aDataItemChildren name ].
	children add: aDataItemChildren