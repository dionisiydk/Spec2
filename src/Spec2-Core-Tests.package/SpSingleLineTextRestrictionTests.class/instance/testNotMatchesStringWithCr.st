tests
testNotMatchesStringWithCr

	self deny: (restriction matches: 'line1', String cr, 'line2')