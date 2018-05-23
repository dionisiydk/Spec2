initialization
createExpansionButton
	
	| icon |
	icon := model isExpanded 
		ifTrue: [ ui theme treeExpandedForm ] ifFalse: [ ui theme treeUnexpandedForm ].
		
	^SpCommandPresenter 
		buttonOn: [ model toggleExpansion ]
		named: ''
		icon: icon