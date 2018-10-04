I mask given strings.

To create my instances use following expression: 

	SpMaskTextDecoration mask: '8(***)***-**-**'

Try following examples: 

	(SpMaskTextDecoration mask: '8(***)*-**-**') 
		convertNativeTextToDecorated: '12345'. " => 8(123)4-5*-**"
		
	(SpMaskTextDecoration mask: '8(***)*-**-**') 
		convertDecoratedTextToNative: '8(123)4-*6-**'. " => 1234*6**"

By default I use * character as asterix. But it can be redefined in my variable #asterix
	
	Instance Variables
		mask:		<String>
		asterix:		<Character>