Class {
	#name : #SpValueSelectorPresenterTestCase,
	#superclass : #SpValueInputPresenterTestCase,
	#instVars : [
		'optionDataset'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpValueSelectorPresenterTestCase class >> isAbstract [
	^self = SpValueSelectorPresenterTestCase
]

{ #category : #running }
SpValueSelectorPresenterTestCase >> defaultModel [
	^#value1 aspect itself asValueHolder
]

{ #category : #running }
SpValueSelectorPresenterTestCase >> defaultOptionDataset [
	^(SpSimpleDataSource on: #(#value1 #value2 #value3)) asSpecDataset 
]

{ #category : #running }
SpValueSelectorPresenterTestCase >> newValueForModel [
	^#newValue
]

{ #category : #running }
SpValueSelectorPresenterTestCase >> setUp [
	optionDataset := self defaultOptionDataset.
	super setUp.
]

{ #category : #tests }
SpValueSelectorPresenterTestCase >> testConvertsGivenOptionsToDataset [

	| compatibleObject |
	compatibleObject := SpSimpleDataSource on: #(1 2 3).
	presenter optionDataset: compatibleObject.
	
	self assert: presenter optionDataset class equals: SpDataset.
	self assert: presenter optionDataset dataSource equals: compatibleObject.
]

{ #category : #tests }
SpValueSelectorPresenterTestCase >> testHasSingleSelectionStrategyByDefault [

	self assert: presenter selectionStrategy class equals: SpSingleSelectionStrategy 
]
