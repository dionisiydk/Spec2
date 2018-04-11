accessing
synchronize

	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		value := baseValueHolder value convertValueToStringBy: stringConverter.
		self valueChanged: oldValue]