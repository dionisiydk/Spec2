accessing
value: aString
	
	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		self rawValue: aString.
		self valueChanged: oldValue ].