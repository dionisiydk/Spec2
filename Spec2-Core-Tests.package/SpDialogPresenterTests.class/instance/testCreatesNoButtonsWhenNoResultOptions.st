tests
testCreatesNoButtonsWhenNoResultOptions

	presenter resultOptions removeAll.

	self assert: presenter toolbar children isEmpty