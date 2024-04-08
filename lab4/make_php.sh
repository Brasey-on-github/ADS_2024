#!/bin/sh

OUT=./index.php
BEGIN=./lab04_template/template_begin.php
END=./lab04_template/template_end.php
RAW_FILE_DIR=./lab04_raw_files/
THUMBNAILS=./thumbnails/

ARTICLE_HEADER='		 <article class="container article"> '
IMAGE_HEADER='						<div class="row">
                                        <div class="col-md-10 col-md-pull-3 col-md-offset-4 article__content">
                                            
                                            <div >
                                                <div><h2>Découvrez-nous en images</h2></div>
                                            </div>
                                            
                                            <div class="row">
                                
                                <div class="row">'

IMAGE_FOOTER='					</div>
                            </div>
                        </div>'

FLYERS_HEADER='			<div class="row" style="margin-top: 40px;">
                            <div class="col-md-10 col-md-pull-3 col-md-offset-4 article__content">
                                
                                <div >
                                    <div><h2>Téléchargez nos brochures</h2></div>
                                </div>
                                
                                <div class="row">'

FLYERS_FOOTER='					</div>
                            </div>
                        </div> '

ARTICLE_FOOTER='		</article> '

# Beginning of html page never change
echo "$(cat $BEGIN)" > $OUT;

# Generate images list
echo $ARTICLE_HEADER >> $OUT;
echo $IMAGE_HEADER >> $OUT;

for filename in $RAW_FILE_DIR*[.jpg,.png];
do
    echo '<div class="col-md-6 col-xs-12">' >> $OUT;
    thumbnail=$(echo $filename | sed -e "s|$RAW_FILE_DIR|$THUMBNAILS|g" | sed -e "s/\.png$/_thumbnails.png/; s/\.jpg$/_thumbnails.jpg/");
    echo "<a href=\"$filename\"><img class=\"vignette\" src=\"$thumbnail\" /></a>" >> $OUT;
    echo '</div>' >> $OUT;
done

echo $IMAGE_FOOTER >> $OUT;

# Generate flyers list 
echo $FLYERS_HEADER >> $OUT;
echo $FLYERS_FOOTER >> $OUT;

for filename in $RAW_FILE_DIR*[.pdf];
do
    echo '<div class="col-md-6 col-xs-12">' >> $OUT;
    thumbnail=$(echo $filename | sed -e "s|$RAW_FILE_DIR|$THUMBNAILS|g" | sed -e "s/\.pdf$/_thumbnails.jpg/");
    echo "<a href=\"$filename\"><img class=\"vignette\" src=\"$thumbnail\" /></a>" >> $OUT;
    echo '</div>' >> $OUT;
done

echo $ARTICLE_FOOTER >> $OUT;

# End of html page never change
echo "$(cat $END)" >> $OUT;