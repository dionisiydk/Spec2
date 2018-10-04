Class {
	#name : #SpLabelPresenter,
	#superclass : #SpSimplePresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpLabelPresenter class >> iconic: iconName [
	^SpIconicLabelPresenter on: iconName
]

{ #category : #'instance creation' }
SpLabelPresenter class >> iconic: iconName withStyle: styleName [
	^SpTextualLabelPresenter on: iconName withStyle: styleName
]

{ #category : #'instance creation' }
SpLabelPresenter class >> textual: labelString [
	^SpTextualLabelPresenter on: labelString
]

{ #category : #'instance creation' }
SpLabelPresenter class >> textual: labelString withStyle: styleName [
	^SpTextualLabelPresenter on: labelString withStyle: styleName
]

{ #category : #initialization }
SpLabelPresenter >> attachToModel [
	"Label represents static label content. So nothing to do here"
]

{ #category : #initialization }
SpLabelPresenter >> detachFromModel [
	"Label represents static label content. So nothing to do here"
]

{ #category : #testing }
SpLabelPresenter >> showsValidData [
	
	^true
]
