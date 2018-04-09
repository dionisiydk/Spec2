instance creation
of: aValueHolder stringConverter: aValueToStringConverter
	^self new 
		actualValueHolder: aValueHolder;
		stringConverter: aValueToStringConverter