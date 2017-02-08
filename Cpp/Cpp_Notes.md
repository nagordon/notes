
# Notes on the lnaguage C++

I am using ubuntu linux on on all these examples. a handy program I use to paste from the clipboard to a cpp file is 

```
xsel -b > datatypes.cpp
```

a simple way to run c programs is to run this oneliner
```
v='filename' && xsel -b > $v.cpp && g++ $v.cpp && ./a.out
```

check and see if the compiler is installed

```bash
g++ -v
```


to compile

```bash
g++ hello.cpp
```

each semicolon is a terminator, so each line must end with ```;```

these two code snippets are the same
```c
x = y;
y = y+1;
add(x, y);
//equals
x = y; y = y+1; add(x, y);
```

 * identifiers are variables. beware of reserved varaibles
 * white space is ignored

```c
/* This is a block 

comment */


// this is a one line comment

```

variables must be declared, here are the primitive types
```
Type	Keyword
Boolean	        	bool
Character		char
Integer	        	int
Floating point		float
Double floating point	double
Valueless		void
Wide character		wchar_t
```

```
"string literals"


```




conditionals
```
// function returning the max between two numbers
 
int max(int num1, int num2) 
{
   // local variable declaration
   int result;
 
   if (num1 > num2)
      result = num1;
   else
      result = num2;
 
   return result; 
}
```
