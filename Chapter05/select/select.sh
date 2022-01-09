#!/usr/bin/env bash

echo "What is your favourite OS?"

select name in "Linux" "Windows" "Mac OS" "Android"
do
    case $name in
        "Linux")
            echo "Linux yes!"
            break
            ;;
        "Windows")
            echo "Windows yes!"
            break
            ;;
        "Mac OS")
            echo "Mac OS yes"
            break
            ;;
        "Android")
            echo "Android yes!"
            break
            ;;
        *)
            echo "error input"
    esac
    break 
done