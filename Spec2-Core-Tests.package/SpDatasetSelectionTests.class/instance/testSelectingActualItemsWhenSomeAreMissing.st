tests
testSelectingActualItemsWhenSomeAreMissing
	
	| newSelectedItems |

	newSelectedItems := { dataset actualItems first. #missingItem }.
	selection selectItemsWith: newSelectedItems.
	
	self assert: selection actualItems equals: newSelectedItems allButLast