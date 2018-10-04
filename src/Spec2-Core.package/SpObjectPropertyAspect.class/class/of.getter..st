instance creation
of: anObject getter: aSelector
	^self new 
		object: anObject;
		valueGetter: aSelector