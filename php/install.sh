#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path


echo "alias php-cli='export PHP_IMAGE=php:5.6-cli && $PWD/php-cli.sh'" >> ~/.bash_alias

echo "alias php-5.6='export PHP_IMAGE=php:5.6-cli && $PWD/php-cli.sh'" >> ~/.bash_alias

echo "alias php-7.1='export PHP_IMAGE=php:7.1-cli && $PWD/php-cli.sh'" >> ~/.bash_alias

echo "alias php-7.2='export PHP_IMAGE=php:7.2-cli && $PWD/php-cli.sh'" >> ~/.bash_alias

echo "alias php-7.2-fpm='export PHP_IMAGE=php:7.2-fpm && $PWD/php-cli.sh'" >> ~/.bash_alias

