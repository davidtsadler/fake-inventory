# Name of directory for storing database files.
DIR_DB=xml
# Name of directory for storing temporary files.
DIR_TMP=tmp
# Name of directory for storing XSL files.
DIR_XSL=xsl
# Name of directory for storing inventory files for importing into software. 
DIR_INVENTORY=inventory

# Database names.
DB_MOVIES=movies.xml
DB_TV=tv.xml
DB_MUSIC=music.xml

# XSL files.
TRANSFORM_MOVIES=movies.xsl
TRANSFORM_TV=tv.xsl
TRANSFORM_MUSIC=music.xsl
MOVIES_FROOITION=movies_frooition.xsl
TV_FROOITION=tv_frooition.xsl
MUSIC_FROOITION=music_frooition.xsl

# Export files.
FROOITION_MOVIES=frooition_movies.csv
FROOITION_TV=frooition_tv.csv
FROOITION_MUSIC=frooition_music.csv

# TV API endpoint.
TV_API="http://thetvdb.com/api"
# URL for getting series ID.
SERIES_ID_URL=$TV_API/"GetSeries.php"

# Name of downloaded series archive
TV_ZIP=en.zip
# XML extracted from downloaded archive.
TV_XML=en.xml
