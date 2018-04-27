controlling
openDetails

	| details dialog result |
	details := detailsPresenter createNewOn: model.
	dialog := SpDialogPresenter on: details.
	dialog useResult: SpOkDialogResult new for: SpSubmitDialogCommand.
	dialog useResult: SpCancelDialogResult new for: SpCancelDialogCommand.
	result := dialog confirmModalFrom: view.
	result class = SpOkDialogResult ifFalse: [ ^self ].
	displayPresenter fullRebuild