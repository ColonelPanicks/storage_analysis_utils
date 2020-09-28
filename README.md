# Storage Analysis Utils

## Overview

A couple of scripts to collect file information and analyse how stale it is.

## Collecting information

```
ruby collect.rb /PATH
```

This collects the information for the filesystem and stores it under a directory called `collection`.

## Analysing information

```
ruby analyse.rb collection/PATH_DATE
```
