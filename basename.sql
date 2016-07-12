CREATE OR REPLACE FUNCTION basename(fullpath text,
                                    suffix text DEFAULT NULL,
                                    separator char DEFAULT '/')
   RETURNS text AS
$$
DECLARE
   basename text;
   suffixre text;
   separare text;
BEGIN
   separare := '^.*' || separator;
   basename := regexp_replace(fullpath, separare, '');
      IF suffix IS NOT NULL THEN
         suffixre := suffix + '$';
         basename := regexp_replace(basename, suffixre, '');
   END IF;
   RETURN basename;
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE;


CREATE OR REPLACE FUNCTION dirname(fullpath text,
                                   separator char DEFAULT '/')
   RETURNS text AS
$$
DECLARE
   separare text;
   dirname text;
   compname text;
BEGIN
   IF position(separator in fullpath) = 0 THEN
      return '';
   END IF;
   separare := '^(.*' || separator || ').*$';
   dirname = regexp_replace(fullpath, separare, '\1');
   IF length(dirname) != 0 THEN
      compname := lpad('', length(dirname), separator);
      IF compname != dirname THEN
         dirname = rtrim(dirname, separator);
      END IF;
   END IF;
   return dirname;
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE;

