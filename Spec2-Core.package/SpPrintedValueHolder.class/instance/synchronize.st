accessing
synchronize

	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		self synchronizeSilently.
		self valueChanged: oldValue]