private
analyzeAndAnnounceChangesOf: oldItems indexedWith: oldIndexCache
	| newDatasetIndex indexChangeDetected |

	oldIndexCache size = items size ifFalse: [ ^self announceChangesOf: oldItems ].
	indexChangeDetected := false.
	oldIndexCache keysAndValuesDo: [ :oldDatasetIndex :oldItem | 
		newDatasetIndex := self datasetIndexOfItem: oldItem ifAbsent: [
			"removal item is detected"
			 ^self announceChangesOf: oldItems ]. 
		oldDatasetIndex = newDatasetIndex 
			ifFalse: [ indexChangeDetected := true ]
			ifTrue: [ "here we check if selected items were just reordered"
				(oldItems indexOf: oldItem) = (items indexOf: (indexCache at: newDatasetIndex))
					ifFalse: [ indexChangeDetected := true ] ]
	].
	indexChangeDetected ifTrue: [ self indexWasUpdated ].
