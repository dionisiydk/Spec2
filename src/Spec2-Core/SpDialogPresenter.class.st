Class {
	#name : #SpDialogPresenter,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'toolbar',
		'title',
		'resultOptions',
		'result',
		'applyingResultBlock'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #controlling }
SpDialogPresenter >> applyResult: aDialogResult [

	result := aDialogResult.
	result apply.
	applyingResultBlock value
]

{ #category : #accessing }
SpDialogPresenter >> applyingResultBlock [
	^ applyingResultBlock
]

{ #category : #accessing }
SpDialogPresenter >> applyingResultBlock: anObject [
	applyingResultBlock := anObject
]

{ #category : #initialization }
SpDialogPresenter >> attachToModel [
	"My model is a presenter with all details which should be confirmed by user.
	My toolbar is depends on the correcness of presented data. 
	So I subscribe on any model changes and update toolbar when it happens.
	It leads to the behaviour when ok button became disabled when data on form is invalid"
	super attachToModel.
	
	self whenModelChangedDo: [ self updateToolbar ]
]

{ #category : #initialization }
SpDialogPresenter >> attachToView [
	super attachToView.
	
	self enableCommands
]

{ #category : #controlling }
SpDialogPresenter >> confirmModalFrom: aView [
	
	self build.
	ui openModal: self over: aView with: [:modalView | 
		applyingResultBlock := [ modalView close ]].
	
	(result isNil and: [self hasResultFor: SpCancelDialogCommand]) ifTrue: [ 
		result := self resultOptionFor: SpCancelDialogCommand ].
	self detachFromModel. "Cleanup all subscriptions on model from itself and children"
	^result
]

{ #category : #initialization }
SpDialogPresenter >> createChildren [
	"My model is the main child presenter with information which user should submit.
	For standard ok/cancel buttons I use toolbar presenter 
	which will collect these commands for my context"
	
	title ifNil: [ title := SpLabelPresenter textual: 'Please confirm:' withStyle: #windowTitle].
	toolbar := SpToolbarPresenter new
]

{ #category : #testing }
SpDialogPresenter >> hasResultFor: aDialogCommandClass [
	^resultOptions includesKey: aDialogCommandClass 
]

{ #category : #initialization }
SpDialogPresenter >> initialize [
	super initialize.
	
	resultOptions := Dictionary new
]

{ #category : #accessing }
SpDialogPresenter >> result [
	^ result
]

{ #category : #accessing }
SpDialogPresenter >> result: anObject [
	result := anObject
]

{ #category : #accessing }
SpDialogPresenter >> resultOptionFor: aDialogCommandClass [

	^resultOptions at: aDialogCommandClass
]

{ #category : #accessing }
SpDialogPresenter >> resultOptions [
	^ resultOptions
]

{ #category : #'styles-default' }
SpDialogPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow vertical.
		layout padding: 6@6.
		layout alignCenter.
		
		layout add: title with: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
		layout add: model with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical matchParent ].
		layout add: toolbar with: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
 ]
]

{ #category : #accessing }
SpDialogPresenter >> title [
	^title
]

{ #category : #accessing }
SpDialogPresenter >> title: aPresenter [
	title := aPresenter
]

{ #category : #accessing }
SpDialogPresenter >> toolbar [
	^ toolbar
]

{ #category : #controlling }
SpDialogPresenter >> updateToolbar [
	toolbar rebuild
]

{ #category : #accessing }
SpDialogPresenter >> useResult: aBlock for: aDialogCommandClass [

	resultOptions at: aDialogCommandClass put: aBlock
]
