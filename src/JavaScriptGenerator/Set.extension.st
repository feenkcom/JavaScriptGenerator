Extension { #name : #Set }

{ #category : #'*JavaScriptGenerator' }
Set >> writeLinkLanguageOn: aStream [
	self ifEmpty: [ "If empty, can't use '{}' or Python will think it is a dict."
		JSGCall new
		target: 'set' asJSGIdentifier;
		writeLinkLanguageOn: aStream.
		^ self ].
	
	aStream << ${.
	self do: [ :item | item writeLinkLanguageOn: aStream ] separatedBy: [ aStream << $, ].
	aStream << $}
]
