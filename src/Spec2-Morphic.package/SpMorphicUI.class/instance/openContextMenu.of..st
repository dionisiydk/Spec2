opening
openContextMenu: aCmdMenu of: aPresenter

	| morphicMenu |
	morphicMenu := aCmdMenu buildContextMenuFor: aPresenter view.
	morphicMenu hasItems ifFalse: [ ^self ].
	
	morphicMenu setInvokingView: aPresenter view.
	morphicMenu invokeModal