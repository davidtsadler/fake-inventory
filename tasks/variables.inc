# Name of directory for storing database files.
DIR_DB=xml
# Name of directory for storing temporary files.
DIR_TMP=tmp
# Name of directory for storing XSL files.
DIR_XSL=xsl

# Database names.
DB_MOVIES=movies.xml
DB_TV=tv.xml
DB_MUSIC=music.xml

# XSL files.
TRANSFORM_TV=tv.xsl

# TV API endpoint.
TV_API="http://thetvdb.com/api"
# URL for getting series ID.
SERIES_ID_URL=$TV_API/"GetSeries.php"

# Name of downloaded series archive
TV_ZIP=en.zip
# XML extracted from downloaded archive.
TV_XML=en.xml
