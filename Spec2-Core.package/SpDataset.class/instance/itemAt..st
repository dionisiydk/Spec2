queries
itemAt: indexInDataset
	| dataItem localIndex |
	localIndex := indexInDataset.	

	expandedItems do: [:each | 
		each dataSourceIndex = localIndex ifTrue: [ ^each ].
		(each hasChildAt: localIndex) ifTrue: [
			^each childItemAt: localIndex].
		(each dataSourceIndex > localIndex) ifTrue: [
			dataItem := dataSource itemAt: localIndex.
			^SpDatasetItem of: self item: dataItem ].
		localIndex := localIndex - each childrenCount.
	].

	dataItem := dataSource itemAt: localIndex.
	^SpDatasetItem of: self item: dataItem 
	