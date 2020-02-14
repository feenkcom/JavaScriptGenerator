Extension { #name : #Character }

{ #category : #'*JavaScriptGenerator' }
Character >> writeJavaScriptOn: aStream [
	aStream
		<< $';
		<< self;
		<< $'
]
