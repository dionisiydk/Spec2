instance creation
of: aValueHolder stringConverter: aValueToStringConverter
	^self new 
		baseValueHolder: aValueHolder;
		stringConverter: aValueToStringConverter;
		synchronize
		