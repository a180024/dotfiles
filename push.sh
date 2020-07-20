#!/bin/bash

gitacp()  {

    git add .
    echo 'Enter the commit message:'
    read -r commitMessage
    git commit -m "$commitMessage"
    git push origin master

}



