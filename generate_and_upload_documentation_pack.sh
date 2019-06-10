#!/bin/bash

rsyn index.html workshop-bigdata-documentation-pack/slides/index.html
rsync -av img/ workshop-bigdata-documentation-pack/slides/img/

rsync ../../dtn-user-guide/_build/latex/CESGA_DTN_User_Guide.pdf workshop-bigdata-documentation-pack/

rsync ../user-guide/_build/latex/CESGA_Hadoop3_User_Guide.pdf workshop-bigdata-documentation-pack/

zip -r workshop-bigdata-documentation-pack.zip workshop-bigdata-documentation-pack/
scp workshop-bigdata-documentation-pack.zip root@bigdata.cesga.es:/var/www/html/files
