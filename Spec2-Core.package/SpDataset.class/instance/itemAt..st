queries
itemAt: globalIndex
	| dataItem localDataSourceIndex |
	localDataSourceIndex := globalIndex.	

	expandedItems do: [:each | 
		each index = localDataSourceIndex ifTrue: [ ^each ].
		(each hasChildAt: localDataSourceIndex) ifTrue: [
			^each childrenItemAt: localDataSourceIndex].
		(each index > localDataSourceIndex) ifTrue: [
			dataItem := dataSource itemAt: localDataSourceIndex.
			^SpDatasetItem of: self item: dataItem ].
		localDataSourceIndex := localDataSourceIndex - each childrenCount.
	].

	dataItem := dataSource itemAt: localDataSourceIndex.
	^SpDatasetItem of: self item: dataItem 
	