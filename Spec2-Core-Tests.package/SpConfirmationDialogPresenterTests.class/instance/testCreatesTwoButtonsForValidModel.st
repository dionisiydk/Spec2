tests
testCreatesTwoButtonsForValidModel

	self assert: presenter model showsValidData.

	self assert: presenter toolbar children size equals: 2