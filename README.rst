Synopsis
--------

``basename.sql`` contains functions which provide equivalents to the
POSIX functions ``basename`` and ``dirname`` for PostgreSQL, and can be
used in any Postgres SQL command.  The functions are written in fairly
standard PL/pgSQL, and should work with any version of PostgreSQL after
version 6.

I make no claim that these functions are SQL/PSM-compliant.

Example
-------

I created these handlers to help with finding nested folders in my music
catalog program, `Catalogia<http://github.com/elfsternberg/catalogia>_`.

``SELECT dirname(mp3a.path) AS parent,
       dirname(mp3b.path) AS child
       FROM catalog_mp3 AS mp3a,
            catalog_mp3 AS mp3b
       WHERE dirname(mp3a.path) != dirname(mp3b.path)                                   
       AND ('^' || dirname(mp3b.path)) ~ dirname(mp3a.path);
``

By the way, that's *hideously* inefficient, but it worked as a demo!

LICENSE AND COPYRIGHT NOTICE: NO WARRANTY GRANTED OR IMPLIED
------------------------------------------------------------

Copyright ⓒ 2016 Elf M. Sternberg <elf.sternberg@gmail.com>

Released under The MIT License.  Please see the LICENSE file for more
details.  All rights not clearly enumerated by the LICENSE are reserved
to the authors.
