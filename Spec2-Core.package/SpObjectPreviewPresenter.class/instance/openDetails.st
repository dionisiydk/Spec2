controlling
openDetails

	| details dialog |
	details := detailsPresenter createNewOn: model.
	dialog := SpDialogPresenter on: details.
	dialog useResult: SpOkDialogResult new for: SpSubmitDialogCommand.
	dialog useResult: SpCancelDialogResult new for: SpCancelDialogCommand.
	dialog openInWindow.