#!/bin/bash

rsync -av css img js lib plugin workshop-bigdata-documentation-pack/slides/
rsyn index.html workshop-bigdata-documentation-pack/slides/index.html

rsync ../../dtn-user-guide/_build/latex/CESGA_DTN_User_Guide.pdf workshop-bigdata-documentation-pack/

rsync ../user-guide/_build/latex/CESGA_Hadoop3_User_Guide.pdf workshop-bigdata-documentation-pack/

rsync -av ../../pyspark_course/unit_*.ipynb workshop-bigdata-documentation-pack/pyspark_course/
rsync -av ../../pyspark_course/exercises/ workshop-bigdata-documentation-pack/pyspark_course/exercises/
rsync -av ../../pyspark_course/solutions/ workshop-bigdata-documentation-pack/pyspark_course/solutions/

zip -r workshop-bigdata-documentation-pack.zip workshop-bigdata-documentation-pack/
scp workshop-bigdata-documentation-pack.zip root@bigdata.cesga.es:/var/www/html/files
