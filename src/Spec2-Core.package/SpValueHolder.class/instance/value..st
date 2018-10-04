accessing
value: anObject
	
	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		self rawValue: anObject.
		self valueChanged: oldValue ].