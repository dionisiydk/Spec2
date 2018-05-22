accessing
actualItems: anArray
	items := anArray withIndexCollect: [ :each :i | each asDataItem index: i ]