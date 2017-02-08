#slide 2
##$ - For names

#slide 3
x=c("a","b","c","c","d","a")
x[1]
##[1] "a"
x[4]
u=x>"a"
u
x[u]

#slide 5
##Defult of subsetting a number from a matirx is to return a vector
##this can be turned off by using "drop = FALSE"
##same goes with subsetting a single column for row

#slide 7
##example of creating named list
x=list(foo=1:4, bar=0.6)
x[1]
##$foo
##[1] 1 2 3 4    ##You got a list
x[[1]]
##[1] 1 2 3 4 this is just a sequence of numbers
x$bar
##[1] 0.6 gives you the element associated with the name "bar"
x[["bar"]]
##[1] 0.6 same as using the dollar sign
x["bar"]
##[1] 0.6 this is a list with the element "bar" in it

#slide
##to extract multiple elements from a list you must use []
x=list(foo=1:4, bar=0.6, baz="hello")
x[c(1,3)]
##$foo
##[1] 1 2 3 4

##$baz
##[1] "hello"

#slide 9
name="foo"
x[[name]]
##[1] 1 2 3 4   ##brings te "foo" list up

#slide 10
##[[]] can be used to extract numbers from nested lists

#slide 11
##the $ looks for a name that matches the letter used
##[[]] expects an exact match for a name, unless you state exact=FALSE

#slide 12
x=c(1,2,NA,4,NA,5)
bad=is.na(x)
bad
x[!bad] ##exclaimation point (bang) is the opposite

#slide 13
