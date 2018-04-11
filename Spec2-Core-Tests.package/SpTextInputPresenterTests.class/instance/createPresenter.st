running
createPresenter
	^SpTextInputPresenter on: (
		SpPrintedValueHolder of: 10 asValueHolder stringConverter: SpNumberToStringConverter default)