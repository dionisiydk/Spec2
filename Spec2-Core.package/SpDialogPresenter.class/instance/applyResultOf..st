controlling
applyResultOf: aDialogCommandClass

	| resultBlock |
	resultBlock := self resultBlockFor: aDialogCommandClass.
	result := resultBlock value