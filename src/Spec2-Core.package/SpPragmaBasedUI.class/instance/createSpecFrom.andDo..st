specs collection
createSpecFrom: aMethod andDo: aBlock

	SpPresenterSpec allSubclassesDo: [ :each |
		(each isDefinedIn: aMethod) ifTrue: [ 
			^aBlock value: (each createFromMethod: aMethod) ]		
	]
	
	