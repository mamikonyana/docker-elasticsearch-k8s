#/bin/bash

push_to_dockerhub=false

USAGE='Usage of the script shoulbe be: build.sh [--push]'

while [ "$1" != "" ]; do
    case "$1"  in
        --push )
            push_to_dockerhub=true
            ;;
        * )
            echo $USAGE
            exit 1
    esac
    shift
done


for version in [1-9].[0-9];
do
    build_command="docker build -t arsen/elasticsearch-k8s:$version $version";
    echo 'running the following build_command';
    echo $build_command;
    $build_command;

    if $push_to_dockerhub ; then
      push_command="docker push arsen/elasticsearch-k8s:$version"
      echo 'running the following build_command';
      echo $push_command;
      $push_command;
    fi
done
