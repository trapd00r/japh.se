#!/bin/sh
rbenv local 2.7.8
bundle exec jekyll build && rsync -avz --delete _site/ debbie:/var/www/html/ && echo "Done."
