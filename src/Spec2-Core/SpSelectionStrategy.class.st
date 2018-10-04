Class {
	#name : #SpSelectionStrategy,
	#superclass : #Object,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'items convertion' }
SpSelectionStrategy >> convertItemsToSelectionModel: selectedItemsArray [

	self subclassResponsibility 
]

{ #category : #'items convertion' }
SpSelectionStrategy >> convertSelectionModelToItems: anObject [

	self subclassResponsibility 
]

{ #category : #testing }
SpSelectionStrategy >> isMultiple [
	^self isSingle not
]

{ #category : #testing }
SpSelectionStrategy >> isSingle [
	self subclassResponsibility 
]

{ #category : #'model creation' }
SpSelectionStrategy >> prepareExistenceModelOfItem: anObject in: aValueHolder [
	self subclassResponsibility 
]

{ #category : #operations }
SpSelectionStrategy >> toggleItems: selectedItemsArray inSelectionModel: aValueHolder [
	"We expect single value model when selection is single.
	And we expect list value model when selection is multiple"
	
	self subclassResponsibility 
]
