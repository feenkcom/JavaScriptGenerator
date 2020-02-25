Extension { #name : #String }

{ #category : #'*JavaScriptGenerator' }
String >> asJSGI [
	"Shortcut for #asP3GIdentifier."
	^ self asJSGIdentifier
]

{ #category : #'*JavaScriptGenerator' }
String >> asJSGIdentifier [
	^ JSGIdentifier new
		name: self;
		yourself
]

{ #category : #'*JavaScriptGenerator' }
String >> asJSGString [
	^ JSGString string: self
]

{ #category : #'*JavaScriptGenerator' }
String >> writeLinkLanguageOn: aStream [
	self asJSGString writeLinkLanguageOn: aStream
]
