Class {
	#name : #SpSelectionBasedValueSelectorPresenter,
	#superclass : #SpFullListValueSelectorPresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpSelectionBasedValueSelectorPresenter >> attachToModel [
	super attachToModel.
	
	optionSelection attachToActualModel: model
]

{ #category : #initialization }
SpSelectionBasedValueSelectorPresenter >> detachFromModel [
	super detachFromModel.
	
	optionSelection detachFromActualModel: model
]
