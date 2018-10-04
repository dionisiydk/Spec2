My subclasses are resppnsible for converting given values to and from string.
They must implement following methods: 

- convertValueToString: anObject
- parseValueFromString: aString 

Users can use default instance:

	SpNumberToStringConverter default