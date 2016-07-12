CREATE TABLE testdata (name TEXT, direxpected TEXT, baseexpected TEXT);

INSERT INTO testdata VALUES ('/foo/bar', '/foo', 'bar');
INSERT INTO testdata VALUES ('/', '/', '');
INSERT INTO testdata VALUES ('foo', '', 'foo');
INSERT INTO testdata VALUES ('////foo', '////' ,'foo');
INSERT INTO testdata VALUES ('//foo//bar', '//foo' ,'bar');
INSERT INTO testdata VALUES ('/foo/bar', '/foo', 'bar');
INSERT INTO testdata VALUES ('/foo/bar/', '/foo/bar', '');

SELECT name, basename(name) AS basetest, baseexpected, dirname(name) AS dirtest, direxpected,
             CASE WHEN basename(name) = baseexpected THEN 'PASS' ELSE 'FAIL' END AS base,
             CASE WHEN dirname(name) = direxpected THEN 'PASS' ELSE 'FAIL' END AS dir FROM testdata;

DROP TABLE testdata;
DROP FUNCTION IF EXISTS basename(text, text, char);
DROP FUNCTION IF EXISTS dirname(text, char);
