tests
testSelectingActualItems
	
	| newSelectedItems |

	newSelectedItems := { dataset actualItems first. dataset actualItems last }.
	selection selectItemsWith: newSelectedItems.
	
	self assert: selection actualItems equals: newSelectedItems