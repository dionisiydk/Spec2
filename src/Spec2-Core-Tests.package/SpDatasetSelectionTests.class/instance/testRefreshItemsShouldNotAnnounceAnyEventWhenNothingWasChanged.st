tests
testRefreshItemsShouldNotAnnounceAnyEventWhenNothingWasChanged
	
	| thereWasEvent |
	thereWasEvent := false.
	selection selectItemsWith: { dataset actualItems first. dataset actualItems third }.
	selection announcer when: Announcement do: [ thereWasEvent := true ].
	
	selection refreshItems.
	
	self deny: thereWasEvent