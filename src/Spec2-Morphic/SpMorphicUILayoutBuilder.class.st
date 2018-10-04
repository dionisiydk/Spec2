Class {
	#name : #SpMorphicUILayoutBuilder,
	#superclass : #SpUILayoutBuilder,
	#category : 'Spec2-Morphic-UI'
}

{ #category : #private }
SpMorphicUILayoutBuilder >> addChildView: aMorph [
	viewContainer addMorphBack: aMorph
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignBottomCenter [
	viewContainer 
		listCentering: #center;
		wrapCentering: #bottomRight
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignBottomLeft [
	viewContainer 
		listCentering: #topLeft;
		wrapCentering: #bottomRight
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignBottomRight [
	viewContainer 
		listCentering: #bottomRight;
		wrapCentering: #bottomRight
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignCenter [
	viewContainer 
		listCentering: #center;
		wrapCentering: #center
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignCenterLeft [
	viewContainer 
		listCentering: #topLeft;
		wrapCentering: #center
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignCenterRight [
	viewContainer 
		listCentering: #bottomRight;
		wrapCentering: #center
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignTopCenter [
	viewContainer 
		listCentering: #center;
		wrapCentering: #topLeft
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignTopLeft [
	viewContainer 
		listCentering: #topLeft;
		wrapCentering: #topLeft
]

{ #category : #'layout-alignment' }
SpMorphicUILayoutBuilder >> alignTopRight [
	viewContainer 
		listCentering: #bottomRight;
		wrapCentering: #topLeft
]

{ #category : #'layout-strategies' }
SpMorphicUILayoutBuilder >> beFlow [
	viewContainer changeTableLayout.
	^self horizontal
]

{ #category : #'layout-strategies' }
SpMorphicUILayoutBuilder >> beProportional [
	viewContainer changeProportionalLayout
]

{ #category : #building }
SpMorphicUILayoutBuilder >> buildBy: aBlock [
	super buildBy: aBlock.

	(viewContainer layoutPolicy notNil and: [viewContainer layoutPolicy isProportionalLayout]) 
		ifTrue: [ viewContainer addPaneSplitters ]
]

{ #category : #'layout-strategies' }
SpMorphicUILayoutBuilder >> horizontal [
	viewContainer listDirection: #leftToRight.
	viewContainer wrapDirection: #none
]

{ #category : #private }
SpMorphicUILayoutBuilder >> layoutChildView: childView with: layoutBlock [
	layoutBlock value: (SpChildMorphLayoutBuilder on: childView parent: viewContainer)
]

{ #category : #insets }
SpMorphicUILayoutBuilder >> padding: aPoint [ 
	viewContainer layoutInset: aPoint
]

{ #category : #'layout-strategies' }
SpMorphicUILayoutBuilder >> vertical [
	viewContainer listDirection: #topToBottom.
	viewContainer wrapDirection: #none
]
