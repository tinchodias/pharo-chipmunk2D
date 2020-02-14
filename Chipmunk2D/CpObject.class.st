Class {
	#name : #CpObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'CpTLibrary',
	#classTraits : 'CpTLibrary classTrait',
	#pools : [
		'CpTypeAlias'
	],
	#category : #'Chipmunk2D-Model'
}

{ #category : #'as yet unclassified' }
CpObject >> indirectCall: fnSpec [
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		options: #( optIndirectCall );
		function: fnSpec library: self ffiLibrary
]

{ #category : #'as yet unclassified' }
CpObject >> initialize [
	self autoRelease
]
