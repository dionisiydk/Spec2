Class {
	#name : #SpPopupMorph,
	#superclass : #SpContainerMorph,
	#instVars : [
		'targetPresenter'
	],
	#category : 'Spec2-Morphic-Views'
}

{ #category : #'instance creation' }
SpPopupMorph class >> with: aPresenter [

	^self new
		targetPresenter: aPresenter
]

{ #category : #opening }
SpPopupMorph >> close [
	self delete.
	
	targetPresenter detachFromModel
]

{ #category : #initialization }
SpPopupMorph >> initialize [
	super initialize.
	
	self changeTableLayout
]

{ #category : #'event handling' }
SpPopupMorph >> keyboardFocusChange: gotFocus [
	super keyboardFocusChange: gotFocus.

	gotFocus ifFalse: [ self close ]
]

{ #category : #'wiw support' }
SpPopupMorph >> morphicLayerNumber [
	^10
]

{ #category : #opening }
SpPopupMorph >> openVerticalOver: parentMorph [
	 
	self positionVerticalOver: parentMorph.
	
	parentMorph world addMorphInLayer: self.
	
	"There is strange issue that during first layouting the sizes are not computed correctly"
	self positionVerticalOver: parentMorph. 
	
	self takeKeyboardFocus
]

{ #category : #opening }
SpPopupMorph >> positionVerticalOver: parentMorph [
	| height topSpace bottomSpace pos |
	height := self height.
	topSpace := parentMorph boundsInWorld top - parentMorph world top.
	bottomSpace := parentMorph world bottom - parentMorph boundsInWorld bottom.
	pos := height <= bottomSpace
		ifTrue: [#below]
		ifFalse: [height <= topSpace
			ifTrue: [#above]
			ifFalse: [bottomSpace >= topSpace
				ifTrue: [height := bottomSpace. #below]
				ifFalse: [height := topSpace. #above]]].
		
	pos = #above
		ifTrue: [	self position: parentMorph boundsInWorld topLeft - (0 @ height)]
		ifFalse: [self position: parentMorph boundsInWorld bottomLeft ]
]

{ #category : #accessing }
SpPopupMorph >> targetPresenter [
	^ targetPresenter
]

{ #category : #accessing }
SpPopupMorph >> targetPresenter: aPresenter [
	targetPresenter := aPresenter.
	targetPresenter view	
		hResizing: #spaceFill;
		vResizing: #spaceFill.	
	self addMorphBack: targetPresenter view
]
