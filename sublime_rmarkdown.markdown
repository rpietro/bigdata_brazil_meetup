# Sublime text and Rmarkdown for reproducible research

Ricardo Pietrobon

## Introduction
This is a document to help you learn the basics behind Sublime Text along with Rmarkdown. Both constitute an incredibly helpful tool for [reproducible research](http://reproducibleresearch.net/index.php/Main_Page). Without further due, let's get started.

## Why reproducible research, sublime, markdown, and Rmarkdow

* reproducible research: without other people being able to reproduce your research results, there is actually very little difference between science and faith
* Sublime Text: in my opinion, as god as vim but far easier to learn and with a huge number of resources
* Markdown: it's like HTML but semantic, far easier, can be converted to whatever you like, and with some external tools can make your text as re-usable as it gets
* Rmarkdown: it's markdown but with the ability to embed and display any possible R result. Actually, with the knitr package you can include not only R but python and others


## Installing Sublime Text
* Download [Sublime Text 2](http://www.sublimetext.com/2)
* Intall the [package control plugin](http://wbond.net/sublime_packages/package_control) 

Sublime Text 3 has a number of new features but plugin support still falls short

## Shortcuts
* [List 1](http://docs.sublimetext.info/en/latest/reference/keyboard_shortcuts_osx.html)
* [List 2](https://gist.github.com/lucasfais/1207002)


## Packages and other trick

* [gist](https://github.com/condemil/Gist)
* [sendtext](https://github.com/wch/SendText) - remember to open the terminal before you open Sublime
* search for different markdown plugins
* create [snippets](http://sublimetext.info/docs/en/extensibility/snippets.html)
* [marked bonus pack](http://support.markedapp.com/kb/how-to-tips-and-tricks/marked-bonus-pack-scripts-commands-and-bundles)

## knitr and Rmarkdown

* [Ricardo's gist](https://gist.github.com/rpietro/6091531)
* setup
    1. open terminal and fire R
    1. open sublime
    1. open canary
* dot and neato flowcharts with [Ricardo's gist](https://gist.github.com/rpietro/6058722)


## table generation
* [manual markdown tables](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#wiki-tables)
* xtable](http://cran.r-project.org/web/packages/xtable/vignettes/xtableGallery.pdf)
* [memisc](http://cran.r-project.org/web/packages/memisc/index.html)

# pandoc
* install [pandoc](http://johnmacfarlane.net/pandoc/installing.html)
* [file conversion](http://johnmacfarlane.net/pandoc/demos.html)
* [pander](http://rapporter.github.io/pander/) 
* [rapport](http://cran.r-project.org/web/packages/rapport/index.html)