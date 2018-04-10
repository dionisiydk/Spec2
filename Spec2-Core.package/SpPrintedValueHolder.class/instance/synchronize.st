accessing
synchronize

	| oldValue |
	oldValue := value.
	value := (stringConverter convertValueToString: baseValueHolder value).
	self valueChanged: oldValue