tests
testRepresentsFalseWithRadioButtonUnselectedIcon

	| icon |
	model value: false.
	
	icon := presenter children anyOne.
	self assert: icon model equals: #radioButtonUnselected