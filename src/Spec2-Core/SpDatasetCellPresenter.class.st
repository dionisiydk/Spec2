Class {
	#name : #SpDatasetCellPresenter,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'column',
		'contentPresenter',
		'mainDecoration',
		'extraDecorations'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpDatasetCellPresenter class >> on: aDatasetItem column: aDatasetColumn [
	^(self on: aDatasetItem)
		column: aDatasetColumn 
]

{ #category : #initialization }
SpDatasetCellPresenter >> attachToView [
	super attachToView.
	
	self enableCommands
]

{ #category : #accessing }
SpDatasetCellPresenter >> column [
	^ column
]

{ #category : #accessing }
SpDatasetCellPresenter >> column: anObject [
	column := anObject
]

{ #category : #accessing }
SpDatasetCellPresenter >> contentPresenter [
	^ contentPresenter
]

{ #category : #initialization }
SpDatasetCellPresenter >> createChildren [
	contentPresenter := column createCellPresenterFor: model
]

{ #category : #commands }
SpDatasetCellPresenter >> createCommandContext [

	^column createCommandContextFor: model
]

{ #category : #initialization }
SpDatasetCellPresenter >> createExpansionButton [
	
	| commandClass |
	commandClass := model isExpanded 
		ifTrue: [ SpCollapseDatasetCommand ] ifFalse: [ SpExpandDatasetCommand ].
		
	^SpCommandPresenter on: (commandClass atItem: model) withStyle: #iconic
]

{ #category : #accessing }
SpDatasetCellPresenter >> extraDecorations [
	^ extraDecorations
]

{ #category : #accessing }
SpDatasetCellPresenter >> extraDecorations: anObject [
	extraDecorations := anObject
]

{ #category : #testing }
SpDatasetCellPresenter >> isExpandable [
	^column isExpandable and: [model isExpandable]
]

{ #category : #'styles-default' }
SpDatasetCellPresenter >> layoutExpansionButtonOn: aLayout [

	model isExpandable	ifTrue: [ 
		aLayout add: self createExpansionButton with: [ :c | 
			c margin: 3@0.
			c horizontal fitContent.
			c vertical fitContent].
		^self].
	
	aLayout addPanelWith: [ :c | 
		c margin: 3@0.
		c horizontal exact: 9.
		c vertical matchParent ]
]

{ #category : #accessing }
SpDatasetCellPresenter >> mainDecoration [
	^ mainDecoration
]

{ #category : #accessing }
SpDatasetCellPresenter >> mainDecoration: anObject [
	mainDecoration := anObject
]

{ #category : #'styles-default' }
SpDatasetCellPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout alignCenterLeft.
		layout padding: 2@2.
		
		model depth > 0 ifTrue: [ 
			layout addPanelWith: [ :c | 
				c margin: 3@0.
				c horizontal exact: model depth * 9.
				c vertical matchParent ] ].
		column isExpandable ifTrue: [ self layoutExpansionButtonOn: layout].		
		layout add: contentPresenter with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent]
	]
]
