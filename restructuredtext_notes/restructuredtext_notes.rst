===============
Document title
===============

:fieldname:   field body

========
Part 1
========

**************
Chapter 1
**************


-----------
Subtitle 1
-----------

Section 1
==========


SubSection 1
-------------

SubSubsection 1
~~~~~~~~~~~~~~~~

SubSubSection no bold 1
^^^^^^^^^^^^^^^^^^^^^^^^


paragraph 1
"""""""""""




Section 2
-------------------

Chapter 2
==========

adding urls

linked text

.. _reStructuredText: http://docutils.sf.net/rst.html

reStructuredText_

External hyperlinks, like `Python
<http://www.python.org/>`_.

Internal crossreferences, like example_.




.. more inlines notes that will never be read

or just plain words

footnotes are easy to add [#]_  or you can
define an explicit footnote [#f1]_

.. [#] here is my footnote
.. [#f1] and my other footnote


Lorem ipsum [Ref]_ dolor sit amet.

.. [Ref] Book or article reference, URL or whatever.




| line blocks are handy to have
| line breaks


horizontal line breaks are 4 or more characters

-------------



standalone url

<http://docutils.sf.net/rst.html>

http://docutils.sf.net/rst.html



*italics*

**bold**

``inline code``

`interpreted`

\*text surrounded by asterisks\*

1. list item 1
2. list item 2
#. list item 3

1) list item 1
2) list item 2

- list item 1
 - sublist item 1
  - subsublist item 1
  - subsublist item 2
 - list item 2
 - list item 3
- list item 2

.. _example:


links to titles

`Fake Document Title 1`_.


 single spaces
 gives a line in
 front of the text

normal text here

definition
  a way to describe things


::

 here is some code
 that is preserved

and here is some text

::

 .. image:: images/biohazard.png
    :height: 100
    :width: 200
    :scale: 50
    :alt: alternate text

.. image:: ./biohazard.png
   :height: 100
   :width: 200
   :scale: 50
   :alt: alternate text


or simply

``.. image:: images/biohazard.png``

.. image:: ./biohazard.png



It may also be handy to use inline images |biohazard| symbol must be used on containers used to dispose of medical waste.

.. |biohazard| image:: biohazard.png




Tables

=====  =====  =======
A      B      A and B
=====  =====  =======
False  False  False
True   False  False
False  True   False
True   True   True
=====  =====  =======


+------------------------+------------+----------+----------+
| Header row, column 1   | Header 2   | Header 3 | Header 4 |
| (header rows optional) |            |          |          |
+========================+============+==========+==========+
| body row 1, column 1   | column 2   | column 3 | column 4 |
+------------------------+------------+----------+----------+
| body row 2             | ...        | ...      |          |
+------------------------+------------+----------+----------+
