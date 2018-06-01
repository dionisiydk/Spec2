private
analyzeAndAnnounceChangesOf: oldIndexedItems
	| newIndex indexChangeDetected |

	oldIndexedItems size = items size ifFalse: [ ^self announceChangesOf: oldIndexedItems ].
	indexChangeDetected := false.
	oldIndexedItems keysAndValuesDo: [ :oldIndex :oldItem | 
		newIndex := self indexOfItem: oldItem ifAbsent: [
			"removal item is detected"
			^ self announceChangesOf: oldIndexedItems ]. 
		oldIndex = newIndex ifFalse: [ indexChangeDetected := true ]
	].
	indexChangeDetected ifTrue: [ self indexWasUpdated ]