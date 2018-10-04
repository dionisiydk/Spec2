Class {
	#name : #SpDialogPresenterTests,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpDialogPresenterTests >> createPresenter [
	^SpDialogPresenter on: model
]

{ #category : #running }
SpDialogPresenterTests >> defaultModel [
	^SpMultiLabelPresenterExample new
]

{ #category : #tests }
SpDialogPresenterTests >> testAddingResultOption [

	| result |
	result := SpOkDialogResult new.
	presenter useResult: result for: SpSubmitDialogCommand.
	
	self assert: presenter resultOptions size equals: 1.
	self assert: (presenter resultOptionFor: SpSubmitDialogCommand) == result
]

{ #category : #tests }
SpDialogPresenterTests >> testApplyingResult [
	| done result |
	done := false.
	result := SpOkDialogResult with: [ done := true ].
	
	presenter applyResult: result.
	
	self assert: presenter result equals: result.
	self assert: done
]

{ #category : #tests }
SpDialogPresenterTests >> testCheckThatResultExistsForCommand [

	presenter useResult: SpOkDialogResult new for: SpSubmitDialogCommand.
	
	self assert: (presenter hasResultFor: SpSubmitDialogCommand).
	self deny: (presenter hasResultFor: SpCancelDialogCommand)
]

{ #category : #tests }
SpDialogPresenterTests >> testCreatesDefaultTitle [

	self assert: presenter title notNil.
	self assert: presenter title view notNil
]

{ #category : #tests }
SpDialogPresenterTests >> testCreatesNoButtonsWhenNoResultOptions [

	presenter resultOptions removeAll.

	self assert: presenter toolbar children isEmpty
]

{ #category : #tests }
SpDialogPresenterTests >> testCreatesOnlyButtonsForExistingResultOptions [

	presenter useResult: SpOkDialogResult new for: SpCancelDialogCommand.
	presenter updateToolbar.

	self assert: presenter toolbar commands size equals: 1.
	self assert: presenter toolbar commands anyOne class equals: SpCancelDialogCommand.
]

{ #category : #tests }
SpDialogPresenterTests >> testCreatesSubmitButtonForValidModel [

	self assert: presenter toolbar children size equals: 0.
	self assert: presenter model showsValidData.
	
	presenter useResult: SpOkDialogResult new for: SpSubmitDialogCommand.
	presenter updateToolbar.
	
	self assert: presenter toolbar commands size equals: 1.
	self assert: presenter toolbar commands anyOne class equals: SpSubmitDialogCommand.
]

{ #category : #tests }
SpDialogPresenterTests >> testDoesNotCreateSubmitCommandForInvalidModel [
	| invalidValue field |
	invalidValue := 10 aspect itself restriction: (SpNumberRestriction minValue: 1000); asValueHolder.
	self deny: invalidValue isValid.
	field := SpFormFieldPresenter on: invalidValue.
	
	presenter := SpDialogPresenter on: field.
	presenter useResult: SpOkDialogResult for: SpSubmitDialogCommand.
	presenter buildIn: ui.
	
	self deny: presenter showsValidData.
	self assert: presenter toolbar children isEmpty
]

{ #category : #tests }
SpDialogPresenterTests >> testHasEmptyResultOptionsByDefault [

	self assert: presenter resultOptions isEmpty
]

{ #category : #tests }
SpDialogPresenterTests >> testLayoutModelPresenter [

	self assert: (presenter children includes: presenter model).
	self assert: presenter model view notNil
]

{ #category : #tests }
SpDialogPresenterTests >> testModalConfirmation [
	| started result modalProcess expectedResult |
	started := false.
	modalProcess := [started := true. result := presenter confirmModalFrom: #view] fork.
	[ started ] whileFalse: [ Processor yield ].
	self assert: result isNil.
	
	expectedResult := SpOkDialogResult new.
	presenter applyResult: expectedResult.
	[ modalProcess isTerminated ] whileFalse: [ Processor yield ].	
	self assert: result equals: expectedResult
]

{ #category : #tests }
SpDialogPresenterTests >> testModalConfirmationWhenDialogWasClosedWithoutResult [
	| started result modalProcess |
	started := false.
	modalProcess := [started := true. result := presenter confirmModalFrom: #view] fork.
	[ started ] whileFalse: [ Processor yield ].
	self assert: result isNil.
	
	ui simulateModalClose.
	[ modalProcess isTerminated ] whileFalse: [ Processor yield ].	
	self assert: result isNil
]

{ #category : #tests }
SpDialogPresenterTests >> testModalConfirmationWhenDialogWasClosedWithoutResultButThereAreResultForCancelCommand [
	| started result modalProcess |
	presenter useResult: SpCancelDialogResult new for: SpCancelDialogCommand.
	presenter updateToolbar.
	started := false.
	modalProcess := [started := true. result := presenter confirmModalFrom: #view] fork.
	[ started ] whileFalse: [ Processor yield ].
	self assert: result isNil.
	
	ui simulateModalClose.
	[ modalProcess isTerminated ] whileFalse: [ Processor yield ].	
	self assert: result class equals: SpCancelDialogResult
]

{ #category : #tests }
SpDialogPresenterTests >> testRemovesSubmitButtonWhenModelBecomeInvalid [
	| invalidValue field |
	invalidValue := 10 aspect itself restriction: (SpNumberRestriction minValue: 9); asValueHolder.
	field := SpFormFieldPresenter on: invalidValue.
	presenter := SpDialogPresenter on: field.
	presenter useResult: SpOkDialogResult for: SpSubmitDialogCommand.
	presenter buildIn: ui.
	self assert: presenter showsValidData.
	self assert: presenter toolbar children size equals: 1.
	
	invalidValue value: 0.
	self deny: invalidValue isValid.
	self deny: presenter showsValidData.	
	self assert: presenter toolbar children isEmpty
]
