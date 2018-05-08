accessing
cellColumn: column row: rowIndex

	| item |
	item := self elementAt: rowIndex.
	^(column buildCellFor: item) view