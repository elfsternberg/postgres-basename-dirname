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
catalog program, `Catalogia<http://github.com/elfsternberg/catalogia>`.

::

   WITH prepped_paths AS (SELECT DISTINCT dirname(path) AS dpath FROM catalog_mp3)
     SELECT a.dpath AS parent, b.dpath AS child
     FROM prepped_paths AS a, prepped_paths AS b
     WHERE a.dpath != b.dpath
     AND a.dpath ~ ('^' || b.dpath);

Status
------

**July 12, 2016**: This project is **conditionally complete**. No new
features are being considered, but bug reports will be accepted and
(eventually) acted upon.

LICENSE AND COPYRIGHT NOTICE: NO WARRANTY GRANTED OR IMPLIED
------------------------------------------------------------

Copyright ⓒ 2016 Elf M. Sternberg <elf.sternberg@gmail.com>

Released under The MIT License.  Please see the LICENSE file for more
details.  All rights not clearly enumerated by the LICENSE are reserved
to the authors.
