"
A P3GLambdaTest is a test class for testing the behavior of P3GLambda
"
Class {
	#name : #JSGLambdaTest,
	#superclass : #TestCase,
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #tests }
JSGLambdaTest >> assertCode: expr equals: targetStr [
	| string |
	string := String streamContents: [ :s | expr writeLinkLanguageOn: s ].
	self assert: string equals: targetStr
]

{ #category : #tests }
JSGLambdaTest >> testMultipleArguments [
	| lambda |
	lambda := JSGLambda 
					arguments: (Array with: #a asJSGI with: #b asJSGI with: #c asJSGI)
					expression: #a asJSGI + (#b asJSGI callWith: (Array with: #c asJSGI)).
	self assertCode: lambda equals: '(lambda a, b, c: a+b(c))'
]

{ #category : #tests }
JSGLambdaTest >> testReturn1 [
	self assertCode: (JSGLambda expression: 1) equals: '(lambda : 1)'
]

{ #category : #tests }
JSGLambdaTest >> testSingleArgument [
	self assertCode: (JSGLambda argument: #a asJSGI expression: #a asJSGI + 1) equals: '(lambda a: a+1)'
]
