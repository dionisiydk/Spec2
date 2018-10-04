accessing
actualItems: anArray
	| index |
	index := 0.
	items := anArray 
		collect: [ :each | each asDataItem index: (index := index + 1) ] 
		as: Array