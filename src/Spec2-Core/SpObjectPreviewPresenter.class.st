Class {
	#name : #SpObjectPreviewPresenter,
	#superclass : #SpValuePresenter,
	#instVars : [
		'displayPresenter',
		'detailsPresenter'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpObjectPreviewPresenter class >> withDetails: aPresenter [
	^self new 
		detailsPresenter: aPresenter
	
]

{ #category : #initialization }
SpObjectPreviewPresenter >> createChildren [
	
	displayPresenter := SpTextInputPresenter on: model
]

{ #category : #accessing }
SpObjectPreviewPresenter >> detailsPresenter [
	^ detailsPresenter
]

{ #category : #accessing }
SpObjectPreviewPresenter >> detailsPresenter: anObject [
	detailsPresenter := anObject
]

{ #category : #accessing }
SpObjectPreviewPresenter >> displayPresenter [
	^ displayPresenter
]

{ #category : #'styles-default' }
SpObjectPreviewPresenter >> layoutDetailsOn: aLayout [

	| button |
	button := SpCommandPresenter buttonOn: [ self openDetails ] named: '...'.
	
	aLayout add: button with: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ]
]

{ #category : #controlling }
SpObjectPreviewPresenter >> openDetails [

	| details dialog result |
	details := detailsPresenter createNewOn: model.
	dialog := SpDialogPresenter on: details.
	dialog useResult: SpOkDialogResult new for: SpSubmitDialogCommand.
	dialog useResult: SpCancelDialogResult new for: SpCancelDialogCommand.
	result := dialog confirmModalFrom: view.
	result class = SpOkDialogResult ifFalse: [ ^self ].
	displayPresenter fullRebuild
]

{ #category : #'styles-default' }
SpObjectPreviewPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout add: displayPresenter with: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
		detailsPresenter ifNotNil: [ self layoutDetailsOn: layout].
	]
]
