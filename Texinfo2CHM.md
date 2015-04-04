# Using DocBook XML as intermediate format #

Newer versions of `makeinfo` (included in the texinfo distribution) can output DocBook XML from Texinfo documents.

The conversion is not yet bulletproof — ocasionally invalid XML is generated and `makinfo` dies converting some documents —, but on the otherhand there are less problems converting newer documents since `makeinfo` is always up to date in respect to the Texinfo documents.

Generation of the CHM from the DocBook XML is made using the HTML Help XSL stylesheet included in the DocBook XSL stylesheets.

This is the procedure currently used to generate the CHM books from the GNU documentation manuals.

# Using an adapted version of `texi2html` #

Once I modified `texi2html` to generate the .HHP, .HHC, and .HHK files, and for a long time this was the procedure I use to generate all the CHM books from the GNU documentation manuals. Unfortunately the base `texi2html` code was unmaintained for some time and progressively required more pre- and post- processing of the documents in order to convert the newer documentation. (Maintaining the code myself was not at option as I lacked the perl knowledge to do so.)

You can still get the script [here](http://htmlhelp.googlecode.com/svn/trunk/misc/texi2chm) (diff [here](http://htmlhelp.googlecode.com/svn/trunk/misc/texi2html-1.64-chm.diff)).

Good news is that `texi2html` is [alive again](http://texi2html.cvshome.org/), and there is some upstream work iin order to support CHM output for good, which may yield in `texi2html` becoming the best option once again.