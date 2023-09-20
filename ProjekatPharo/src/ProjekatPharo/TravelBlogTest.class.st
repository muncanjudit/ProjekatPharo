Class {
	#name : #TravelBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first',
		'previousRepository'
	],
	#category : #'ProjekatPharo-Tests'
}

{ #category : #running }
TravelBlogTest >> setUp [
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.
	blog  := TravelBlog current .
	first := Travel title: 'A title' description: 'A text'  country: 'Serbia' .
	blog writeBlogPost: first.
	post := (Travel title: 'Another title' description: 'Another text' country: 'Hungary') beVisible
	
	"blog  := TravelBlog current .
	blog removeAllPosts .
	first := Travel title: 'A title' description: 'A text'  country: 'Serbia' .
	blog writeBlogPost: first.
	post := (Travel title: 'Another title' description: 'Another text' country: 'Hungary') beVisible"
]

{ #category : #running }
TravelBlogTest >> tearDown [
	"TravelBlog  reset"
	VORepository setRepository: previousRepository

]

{ #category : #tests }
TravelBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
TravelBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
TravelBlogTest >> testRemoveBlogPost [
	self assert: blog size equals: 1.
	blog removeBlogPost: blog allBlogPosts anyOne.
	self assert: blog size equals: 0
]
