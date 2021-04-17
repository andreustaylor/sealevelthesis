#!/bin/bash
set -eux
fileSrc='papers_raw.bib'
fileTgt='references.bib'

# first drop any google lines
sed '/google/d' ${fileSrc} > ${fileTgt}
# loop over replace lines
for cmd in 's/{Meteorology, Bureau of}/{{Bureau of Meteorology}}/' \
           's/{Service, Australian Hydrographic}/{{Australian Hydrographic Office}}/' \
           's/{Council, Brisbane City}/{{Brisbane City Council}}/' \
           's/{Water, Melbourne}/{{Melbourne Water}}/' \
           's/{Australia, Commonwealth of}/{{Commonwealth of Australia}}/'; do
    # crappy OSX sed makes inplace confusing ( -i isnt the same) 
    sed  "${cmd}"  ${fileTgt} > tmpOsxSed
    cp -v tmpOsxSed ${fileTgt}
done

echo "!! now check {{}}} for Melbourne Water and GDAL !!"
#sed  -i' ' 's/{Service, Australian Hydrographic}/{Australian Hydrographic Office}/' ${fileTgt}
#sed  -i' ' 's/{Australia, Commonwealth of}/{Commonwealth of Australia}/' ${fileTgt}
