controlling
refresh

	| item cells |
	contents := Array new: dataset itemCount.
	1 to: contents size do: [ :i | 
		item := dataset itemAt: i.
		cells := columns collect: [ :each | (each buildCellFor: item) view ].
		contents at: i put: (SpDatasetRowStub with: cells).
	]