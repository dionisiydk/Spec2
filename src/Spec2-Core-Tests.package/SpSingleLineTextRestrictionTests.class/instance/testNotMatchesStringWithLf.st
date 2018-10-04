tests
testNotMatchesStringWithLf

	self deny: (restriction matches: 'line1', String lf, 'line2')