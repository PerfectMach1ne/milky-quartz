#!/usr/bin/bash

npx quartz sync
git push -u origin main # npx quartz sync errors on push; if it somehow doesn't, this won't do any harm.
