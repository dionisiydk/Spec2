Class {
	#name : #SpImagePresenter,
	#superclass : #SpSimplePresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpImagePresenter >> attachToModel [
]

{ #category : #initialization }
SpImagePresenter >> attachToView [
	
	view form: model
]

{ #category : #initialization }
SpImagePresenter >> detachFromModel [

]

{ #category : #testing }
SpImagePresenter >> showsValidData [
	
	^true
]
