tests
testRepresentsTrueWithRadioButtonSelectedIcon

	| icon |
	model value: true.
	
	icon := presenter children anyOne.
	self assert: icon model equals: #radioButtonSelected