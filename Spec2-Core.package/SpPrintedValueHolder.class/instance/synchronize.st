accessing
synchronize

	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		value := (stringConverter convertValueToString: baseValueHolder value).
		self valueChanged: oldValue]