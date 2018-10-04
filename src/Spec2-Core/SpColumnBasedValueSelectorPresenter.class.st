Class {
	#name : #SpColumnBasedValueSelectorPresenter,
	#superclass : #SpFullListValueSelectorPresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpColumnBasedValueSelectorPresenter >> attachToModel [
	super attachToModel.
	
	model whenChangedSend: #modelChanged to: self
	
]

{ #category : #initialization }
SpColumnBasedValueSelectorPresenter >> attachToView [
	super attachToView.
	
	self enableCommands 
]

{ #category : #initialization }
SpColumnBasedValueSelectorPresenter >> createChildren [
	super createChildren.
	
	optionPresenter addFirstColumn: (SpValueSelectorColumn for: model strategy: selectionStrategy)
]

{ #category : #initialization }
SpColumnBasedValueSelectorPresenter >> modelChanged [

	optionPresenter refresh
]

{ #category : #operations }
SpColumnBasedValueSelectorPresenter >> toggleSelectedItems [

	optionSelection toggleItemsInActualModel: model
]
