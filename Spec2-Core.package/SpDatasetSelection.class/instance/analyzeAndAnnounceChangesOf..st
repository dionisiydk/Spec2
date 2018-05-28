controlling
analyzeAndAnnounceChangesOf: oldItems

	| oldIndex indexChangeDetected |
	self halt.
	oldItems size = items size ifFalse: [ ^self announceChangesOf: oldItems ].
	indexChangeDetected := false.
	items doWithIndex: [ :newItem :newIndex | 
		oldIndex := oldItems findFirst: [ :old | newItem isEqualTo: old].
		oldIndex = 0 ifTrue: [ 
			"new item or removal item is detected"
			^ self announceChangesOf: oldItems ]. 
		oldIndex = newIndex ifFalse: [ indexChangeDetected := true ]
	].
	indexChangeDetected ifTrue: [ self indexWasUpdated ]