# Docker DocToc
[![](https://images.microbadger.com/badges/image/jorgeandrada/doctoc.svg)](https://microbadger.com/images/jorgeandrada/doctoc "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/jorgeandrada/doctoc.svg)](https://microbadger.com/images/jorgeandrada/doctoc "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/commit/jorgeandrada/doctoc.svg)](https://microbadger.com/images/jorgeandrada/doctoc "Get your own commit badge on microbadger.com")

Generates table of contents for markdown files inside local git repository. Links are compatible with anchors generated
by github or other sites via a command line flag.
```
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --gitlab
```

**Original repository of DocToc**:
-   [https://www.npmjs.com/package/doctoc](https://www.npmjs.com/package/doctoc)
-   [https://github.com/thlorenz/doctoc](https://github.com/thlorenz/doctoc)


**Table of Contents:**
-   [Adding toc to all files in a directory and sub directories](#adding-toc-to-all-files-in-a-directory-and-sub-directories)
    -   [Update existing doctoc TOCs effortlessly](#update-existing-doctoc-tocs-effortlessly)
    -   [Adding toc to individual files](#adding-toc-to-individual-files)
    -   [Printing to stdout](#printing-to-stdout)


### Adding toc to all files in a directory and sub directories

Go into the directory that contains you local git project and type:

```shell
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc
```

This will update all markdown files in the current directory and all its
subdirectories with a table of content that will point at the anchors generated
by the markdown parser. Doctoc defaults to using the **github** parser, but you can use doctoc to generate links compatible with other sites

In order to add a table of contents whose links are compatible other sites add the appropriate mode flag:

Available modes are:

```shell
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --bitbucket   bitbucket.org
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --nodejs      nodejs.org
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --github      github.com
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --gitlab      gitlab.com
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --ghost       ghost.org
```

### Update existing doctoc TOCs effortlessly
If you already have a TOC inserted by doctoc, it will automatically be updated by running the command (rather than inserting a duplicate toc). Doctoc locates the TOC by the `<!-- START doctoc -->` and `<!-- END doctoc -->` comments, so you can also move a generated TOC to any other portion of your document and it will be updated there.


### Adding toc to individual files

If you want to convert only specific files, do:
```shell
docker run --rm -it -v /path/to/file:/usr/src jorgeandrada/doctoc
```

```
docker run --rm -it -v /home/monino/Git/doctoc/README.md:/usr/src jorgeandrada/doctoc
```

### Printing to stdout

You can print to stdout by using the `-s` or `--stdout` option.
```
docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --github --stdout
```
```
DocToccing "." and its sub directories for github.com.

Found README.md in "."

==================

- [Docker DocToc](#docker-doctoc)
    - [Adding toc to all files in a directory and sub directories](#adding-toc-to-all-files-in-a-directory-and-sub-directories)
    - [Update existing doctoc TOCs effortlessly](#update-existing-doctoc-tocs-effortlessly)
    - [Adding toc to individual files](#adding-toc-to-individual-files)
      - [Examples](#examples)
    - [Printing to stdout](#printing-to-stdout)

==================

"README.md" should be updated

Everything is OK.
```
