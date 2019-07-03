#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21 
#
#	VERSION: 0.0.4
#
#	CREATED: 2016-10-21
#      REVISION: 2019-06-12
#
# erstellten der user Konfiguration aus doc/src_fsfw-user_config/*  
# und schreibt sie nach "../config/includes.chroot/..."
#

echo "fsfw-user_config.sh - FSFW-Uni-Stick: variant PATH = ${VARIANT_PATH}  -- variant = ${BUILD_VARIANT} "
REPO_ROOT=$(git rev-parse --show-toplevel)


# TODO:  ${DISTRIBUTION}  jessie - stretch .... unterscheiden ??

# aktuallisieren der ../config/includes.chroot/etc/skel/..
# 
#echo "fsfw-user_config.sh - config verteilen"

#rsync -avP --exclude=aux-files/ ../doc/src_fsfw-user_config/ config/includes.chroot/etc/skel

#echo "fsfw-user_config.sh - configuration fertig."

#
echo "FSFW Material/Doku bauen und verteilen"

# TODO: allgemeine Doku zu Progammen oder Funkionen des Live Systems --> doku_create.sh

if [ ! -d ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html ]; then
				 mkdir -p ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html
				 echo " ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html erstellt"
	else
				 echo " ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html vorhanden "
fi

dlist_md=(${VARIANT_PATH}/${BUILD_VARIANT}/doc/src/*.md)

echo " dlist_md = ${dlist_md[@]##*/} "

for f in ${dlist_md[@]##*/} ; 
   do
#    TARGETFILE="../doc/html/${f%%.md}.html"
    TARGETFILE="${VARIANT_PATH}/${BUILD_VARIANT}/doc/html/${f%%.md}.html"

# TODO: Fehler, falls Paket pandoc nicht installiert ist -> Programmverfügbarkeit vorher testen
    cmd="pandoc --standalone --template ${REPO_ROOT}/doc/build-script/fsfw-template.html ${VARIANT_PATH}/${BUILD_VARIANT}/doc/src/${f} -o $TARGETFILE"

echo " cmd = ${cmd}"

    # for debugging:
    # echo $cmd
    
    eval $cmd

    # in the markdown docs there are markdown link targets (to play nicely with github)
    # now its time to convert them

    python3 ${REPO_ROOT}/tools/convert-md-links.py "$TARGETFILE"
    
    echo "Datei geschrieben:" $TARGETFILE
done

echo "FSFW Doku-Erstellung und Verteilung fertig."

