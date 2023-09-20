Class {
	#name : #TravelBlog,
	#superclass : #Object,
	#instVars : [
		'adminUser',
		'travels',
		'allBlogPosts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #ProjekatPharo
}

{ #category : #'as yet unclassified' }
TravelBlog class >> createDemoPosts [
	self current  
		writeBlogPost: ((Travel title: 'Journey to the Alaska' description: 'It was really cold 		winter...Some of them tried to escape, but..' country: 'Alaska')visible: true);
		writeBlogPost: ((Travel title: 'On top of the Kilimanjaro' description: 'Clouds, clouds and snow... it seems pretty...' country: 'Tanzania') visible: true);
		writeBlogPost: ((Travel title: 'Awaking the Nature' description:  'It seemed to be ...yes i understood her, it was really hard situation for her, I mean put...'country: 'Chile') visible: true )
]

{ #category : #accessing }
TravelBlog class >> current [
	"^ uniqueInstance ifNil: [ uniqueInstance := self new ]"
	^ self selectAll
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty: [ self new save ]

]

{ #category : #'as yet unclassified' }
TravelBlog class >> defaultAdminLogin [
	^ 'admin'

]

{ #category : #'as yet unclassified' }
TravelBlog class >> defaultAdminPassword [
	^ 'AdminPass123'

]

{ #category : #accessing }
TravelBlog class >> initialize [
	self reset

]

{ #category : #testing }
TravelBlog class >> initializeVoyageOnMemoryDB [ 
	VOMemoryRepository new enableSingleton 
]

{ #category : #testing }
TravelBlog class >> isVoyageRoot [ 
	^true
]

{ #category : #accessing }
TravelBlog class >> reset [
	self initializeVoyageOnMemoryDB
	

]

{ #category : #'as yet unclassified' }
TravelBlog >> administrator [
	^adminUser
]

{ #category : #'as yet unclassified' }
TravelBlog >> allBlogPosts [
	^travels
]

{ #category : #'as yet unclassified' }
TravelBlog >> allVisibleBlogPosts [
	^travels select: [ :p | p isVisible  ]
]

{ #category : #'as yet unclassified' }
TravelBlog >> createAdministrator [
	^ TravelBAdministrator
		login: self class defaultAdminLogin 
		password: self class defaultAdminPassword 
]

{ #category : #'as yet unclassified' }
TravelBlog >> defaultAdminLogin [
	^ 'admin'
]

{ #category : #'as yet unclassified' }
TravelBlog >> defaultAdminPassword [
	^ 'AdminPass123'
]

{ #category : #initialization }
TravelBlog >> initialize [
	super initialize.
	travels := OrderedCollection new.
	adminUser  := self createAdministrator 
]

{ #category : #initialization }
TravelBlog >> removeAllPosts [ 
	"1travels := OrderedCollection  new"
	"2travels := OrderedCollection new.
	self save.2"
	travels do: [ :each | each remove ].
	travels := OrderedCollection new.
	self save.
]

{ #category : #removing }
TravelBlog >> removeBlogPost: aPost [
	travels  remove: aPost ifAbsent: [ ].
	self save.
]

{ #category : #initialization }
TravelBlog >> size [
	^travels size
]

{ #category : #initialization }
TravelBlog >> writeBlogPost: aPost [
	"1travels add: aPost"
	"2kod njih je self?"
	"2allBlogPosts  add: aPost.
	self save"
	travels add: aPost.
	aPost save.
	self save
	
]
