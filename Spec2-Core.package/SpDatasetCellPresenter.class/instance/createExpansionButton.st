initialization
createExpansionButton
	
	| commandClass |
	commandClass := model isExpanded 
		ifTrue: [ SpCollapseDatasetCommand ] ifFalse: [ SpExpandDatasetCommand ].
		
	^SpCommandPresenter on: (commandClass atItem: model) withStyle: #iconic