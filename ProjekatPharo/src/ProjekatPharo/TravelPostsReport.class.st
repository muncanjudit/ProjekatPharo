Class {
	#name : #TravelPostsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #ProjekatPharo
}

{ #category : #'as yet unclassified' }
TravelPostsReport class >> filteredDescriptionsFrom: aBlogPost [
	^ aBlogPost magritteDescription
		select: [ :each | #(title country date) includes: each accessor selector ]

]

{ #category : #'instance creation' }
TravelPostsReport class >> from: aBlog [
	"|report blogPosts|"
	|report allBlogs |
	allBlogs := aBlog allBlogPosts.
	report := self rows: allBlogs description: allBlogs anyOne magritteDescription.
	report blog: aBlog;
	addColumn:  (MACommandColumn new addCommandOn: report selector: #viewPost: text: 'View';
	yourself;
	addCommandOn: report selector: #editPost: text: 'Edit';
	yourself;
	addCommandOn: report selector: #deletePost: text: 'Delete';
	yourself).
	^report
	
	"| report blogPosts |
	blogPosts := aBlog allBlogPosts.
	report := self rows: blogPosts description: (self
	filteredDescriptionsFrom: blogPosts anyOne).
	report blog: aBlog.
	report addColumn: (MACommandColumn new addCommandOn: report selector: #viewPost: text: 'View';
yourself;
addCommandOn: report selector: #editPost: text: 'Edit';
yourself;
addCommandOn: report selector: #deletePost: text: 'Delete';
yourself).^ report"
]

{ #category : #rendering }
TravelPostsReport >> addPost [
	| post |
	post := self call: (self renderAddPostForm: Travel new).
	post
		ifNotNil: [ blog writeBlogPost: post.
		self refreshReport ]

]

{ #category : #accessing }
TravelPostsReport >> blog [
	^blog
]

{ #category : #accessing }
TravelPostsReport >> blog: aTravelBlog [
	blog := aTravelBlog

]

{ #category : #'as yet unclassified' }
TravelPostsReport >> deletePost: aPost [
	(self confirm: 'Do you want remove this post ?')
		ifTrue: [ blog removeBlogPost: aPost.
			self refreshReport ]
]

{ #category : #rendering }
TravelPostsReport >> editPost: aPost [
	| post |
	post := self call: (self renderEditPostForm: aPost).
	post ifNotNil: [ blog save ]

]

{ #category : #'as yet unclassified' }
TravelPostsReport >> refreshReport [
	self rows: blog allBlogPosts.
	self refresh.

]

{ #category : #rendering }
TravelPostsReport >> renderAddPostForm: aPost [
	^ aPost asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Add post' . #cancel -> 'Cancel'});
		yourself
]

{ #category : #rendering }
TravelPostsReport >> renderContentOn: html [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addPost ];
		with: 'Add post'.
	super renderContentOn: html

]

{ #category : #rendering }
TravelPostsReport >> renderEditPostForm: aPost [
	^ aPost asComponent addDecoration: (
		TBSMagritteFormDecoration buttons: {	#save -> 'Save post'.
			#cancel -> 'Cancel'});
		yourself


]

{ #category : #rendering }
TravelPostsReport >> renderViewPostForm: aPost [
	^ aPost asComponent addDecoration: (TBSMagritteFormDecoration buttons: { #cancel -> 'Back' });
		readonly: true;
		yourself
]

{ #category : #rendering }
TravelPostsReport >> viewPost: aPost [
	self call: (self renderViewPostForm: aPost)

]
