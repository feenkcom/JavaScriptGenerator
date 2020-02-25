Extension { #name : #ByteArray }

{ #category : #'*JavaScriptGenerator' }
ByteArray >> writeLinkLanguageOn: aStream [
	JSGCall new
		target: 'bytearray' asJSGIdentifier;
		positionalArguments:  { self asArray };
		writeLinkLanguageOn: aStream
]
