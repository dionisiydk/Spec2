tests
testBuildingIconicLabelPresenter

	| presenter |
	presenter := SpLabelPresenter iconic: #classIcon.
	
	presenter buildIn: ui.
	
	self assert: presenter view notNil.
	self assert: presenter view form equals: (Smalltalk ui iconNamed: #classIcon)