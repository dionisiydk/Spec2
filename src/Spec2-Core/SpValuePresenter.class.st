Class {
	#name : #SpValuePresenter,
	#superclass : #SpCompositePresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpValuePresenter >> detachFromModel [
	super detachFromModel.
	
	model unsubscribe: self
]

{ #category : #accessing }
SpValuePresenter >> model: anObject [
	super model: anObject asValueHolder
]
