private
indexOfItem: aDatasetItem ifAbsent: absentBlock

	indexCache keysAndValuesDo: [ :index :item |
		(item isEqualTo: aDatasetItem) ifTrue: [ ^index ]	 ].
		
	^absentBlock value