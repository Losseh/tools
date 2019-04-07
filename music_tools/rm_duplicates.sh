#!/bin/sh

ls | grep "(" | xargs -d "\n" rm
