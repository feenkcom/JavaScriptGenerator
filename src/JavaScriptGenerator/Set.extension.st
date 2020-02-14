Extension { #name : #Set }

{ #category : #'*JavaScriptGenerator' }
Set >> writeJavaScriptOn: aStream [
	self ifEmpty: [ "If empty, can't use '{}' or Python will think it is a dict."
		JSGCall new
		target: 'set' asJSGIdentifier;
		writeJavaScriptOn: aStream.
		^ self ].
	
	aStream << ${.
	self do: [ :item | item writeJavaScriptOn: aStream ] separatedBy: [ aStream << $, ].
	aStream << $}
]
