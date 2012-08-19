vim-dict
========

Vim-dict is a dict client. It uses **curl** to connect to dict servers, so make sure you
have **curl** installed.


Installation
------------

Place in *~/.vim/plugin/dict.vim* or in case of Pathogen:

    cd ~/.vim/bundle
    git clone https://github.com/szw/vim-dict.git


Usage
-----

To lookup a word (or words) in the dictionary database use <code>Dict</code> command:

    :Dict hello
    :Dict start up

The <code>Dict</code> command uses the default database. It is stored in the
<code>g:dict\_default\_database</code> global variable.  By default it is set to
<code>"all"</code>

If you want to choose a different one use <code>DictCustom</code> command:

    :DictCustom wn hello
    :DictCustom english start up

By the way, <code>wn</code> stands for the WordNet dictionary.

<code>Dict</code> and <code>DictCustom</code> commands can use the current word under the
cursor. Just move the cursor on a word and type in the command line:

    :Dict
    :DictCustom wn

You can also select words in visual mode and use <code>DictSelection</code>
in the following form:

    :DictSelection
    :DictSelection wn


Configuration
-------------

There are just a few global variables (options) you may set in the *.vimrc* file.

* <code>g:dict\_default\_database</code>

  Sets the default database. By default it is set to <code>"all"</code>.
  The current list of available databases can be downloaded with the following command:

  <code>
    $ curl dict://dict.org/show:db
  </code>

  Example: <code>let g:dict\_default\_database = "wn"</code>

  Here is the list of **dict.org** server:

  + <code>gcide</code> - The Collaborative International Dictionary of English v.0.48
  + <code>wn</code> - WordNet (r) 3.0 (2006)
  + <code>moby-thes</code> - Moby Thesaurus II by Grady Ward, 1.0
  + <code>elements</code> - The Elements (07Nov00)
  + <code>vera</code> - V.E.R.A. -- Virtual Entity of Relevant Acronyms (June 2006)
  + <code>jargon</code> - The Jargon File (version 4.4.7, 29 Dec 2003)
  + <code>foldoc</code> - The Free On-line Dictionary of Computing (26 July 2010)
  + <code>easton</code> - Easton's 1897 Bible Dictionary
  + <code>hitchcock</code> - Hitchcock's Bible Names Dictionary (late 1800's)
  + <code>bouvier</code> - Bouvier's Law Dictionary, Revised 6th Ed (1856)
  + <code>devil</code> - The Devil's Dictionary (1881-1906)
  + <code>world02</code> - CIA World Factbook 2002
  + <code>gaz2k-counties</code> - U.S. Gazetteer Counties (2000)
  + <code>gaz2k-places</code> - U.S. Gazetteer Places (2000)
  + <code>gaz2k-zips</code> - U.S. Gazetteer Zip Code Tabulation Areas (2000)
  + <code>eng-swe</code> - English-Swedish Freedict dictionary
  + <code>nld-eng</code> - Dutch-English Freedict dictionary
  + <code>eng-cze</code> - English-Czech fdicts/FreeDict Dictionary
  + <code>eng-swa</code> - English-Swahili xFried/FreeDict Dictionary
  + <code>ita-eng</code> - Italian-English Freedict dictionary
  + <code>tur-deu</code> - Turkish-German Freedict dictionary
  + <code>nld-fra</code> - Dutch-French Freedict dictionary
  + <code>lat-eng</code> - Latin-English Freedict dictionary
  + <code>eng-fra</code> - English-French Freedict dictionary
  + <code>deu-fra</code> - German-French Freedict dictionary
  + <code>eng-hin</code> - English-Hindi Freedict Dictionary
  + <code>dan-eng</code> - Danish-English Freedict dictionary
  + <code>nld-deu</code> - Dutch-German Freedict dictionary
  + <code>jpn-deu</code> - Japanese-German Freedict dictionary
  + <code>swa-eng</code> - Swahili-English xFried/FreeDict Dictionary
  + <code>fra-deu</code> - French-German Freedict dictionary
  + <code>fra-eng</code> - French-English Freedict dictionary
  + <code>deu-ita</code> - German-Italian Freedict dictionary
  + <code>slo-eng</code> - Slovak-English Freedict dictionary
  + <code>eng-rom</code> - English-Romanian FreeDict dictionary
  + <code>hin-eng</code> - English-Hindi Freedict Dictionary [reverse index]
  + <code>spa-eng</code> - Spanish-English Freedict dictionary
  + <code>eng-lat</code> - English-Latin Freedict dictionary
  + <code>por-deu</code> - Portuguese-German Freedict dictionary
  + <code>gla-deu</code> - Scottish Gaelic-German Freedict dictionary
  + <code>swe-eng</code> - Swedish-English Freedict dictionary
  + <code>scr-eng</code> - Serbo-Croat-English Freedict dictionary
  + <code>deu-nld</code> - German-Dutch Freedict dictionary
  + <code>ita-deu</code> - Italian-German Freedict dictionary
  + <code>fra-nld</code> - French-Dutch Freedict dictionary
  + <code>afr-deu</code> - Afrikaans-German Freedict dictionary
  + <code>ara-eng</code> - Arabic-English FreeDict Dictionary
  + <code>deu-por</code> - German-Portuguese Freedict dictionary
  + <code>tur-eng</code> - English-Turkish FreeDict Dictionary [reverse index]
  + <code>eng-spa</code> - English-Spanish Freedict dictionary
  + <code>eng-ara</code> - English-Arabic FreeDict Dictionary
  + <code>eng-rus</code> - English-Russian Freedict dictionary
  + <code>wel-eng</code> - Welsh-English Freedict dictionary
  + <code>hun-eng</code> - unknown
  + <code>eng-cro</code> - English-Croatian Freedict Dictionary
  + <code>eng-por</code> - English-Portuguese Freedict dictionary
  + <code>world95</code> - The CIA World Factbook (1995)
  + <code>eng-wel</code> - English-Welsh Freedict dictionary
  + <code>cro-eng</code> - Croatian-English Freedict Dictionary
  + <code>lat-deu</code> - Latin-German Freedict dictionary
  + <code>por-eng</code> - Portuguese-English Freedict dictionary
  + <code>eng-nld</code> - English-Dutch Freedict dictionary
  + <code>eng-deu</code> - English-German Freedict dictionary
  + <code>iri-eng</code> - Irish-English Freedict dictionary
  + <code>eng-tur</code> - English-Turkish FreeDict Dictionary
  + <code>eng-scr</code> - English-Serbo-Croat Freedict dictionary
  + <code>eng-iri</code> - English-Irish Freedict dictionary
  + <code>cze-eng</code> - Czech-English Freedict dictionary
  + <code>deu-eng</code> - German-English Freedict dictionary
  + <code>eng-ita</code> - English-Italian Freedict dictionary
  + <code>eng-hun</code> - unknown
  + <code>english</code> - English Monolingual Dictionaries
  + <code>trans</code> - Translating Dictionaries
  + <code>all</code> - All Dictionaries (English-Only and Translating)

* <code>g:dict\_leave\_pw</code>

  If set to <code>1</code> dict leaves the preview window (the focus remains on the
  current window). By default it is set to <code>0</code>.

  Example: <code>let g:dict\_leave\_pw = 0</code>

* <code>g:dict\_host</code>

  The url of the **dict** server. The default is *dict://dict.org*.

  Example: <code>let g:dict\_host = "dict://dict.org"</code>


Useful tips
-----------

On Ubuntu you might want to add system dictionary to Vim:

    set dictionary+=/usr/share/dict/words

This will enable the dictionary in the insert mode (CTRL-X CTRL-K). Additionaly it could
be useful to add the dictionary to the standard word completions (CTRL-N...) for text and
Markdown file types. To do this test the <code>complete</code> to include *k* value:

    au FileType text,markdown setlocal complete+=k


License
-------

Copyright &copy; 2012 Szymon Wrozynski. Distributed under the same terms as Vim itself.
See <code>:help license</code>

