#!/bin/bash

build_flutter_project() {
    local project_name=$1
    echo "Building ${project_name} project..."
    cd modules/${project_name}
    flutter build web --base-href /projects/${project_name}/
    cd ../..
    rm -rf ./projects/${project_name}
    mkdir -p ./projects/${project_name}
    cp -rf modules/${project_name}/build/web/* ./projects/${project_name}
}

if [ $# -eq 0 ]; then
    echo "Please provide an argument: 'queens', 'solitaire' or 'all'"
    exit 1
fi

case $1 in
    "queens")
        build_flutter_project "queens"
        ;;
    "solitaire")
        build_flutter_project "solitaire"
        ;;
    "all")
        build_flutter_project "queens"
        build_flutter_project "solitaire"
        # Add other project builds here
        ;;
    *)
        echo "Invalid argument. Please use 'queens', 'solitaire' or 'all'"
        exit 1
        ;;
esac
