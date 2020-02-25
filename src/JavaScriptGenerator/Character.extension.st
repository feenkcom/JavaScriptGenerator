Extension { #name : #Character }

{ #category : #'*JavaScriptGenerator' }
Character >> writeLinkLanguageOn: aStream [
	aStream
		<< $';
		<< self;
		<< $'
]
