vim-dict
========

**vim-dict** is a dict client. It uses **curl** to connect to dict servers, so make sure you
have **curl** installed.


Installation
------------

Place in *~/.vim/plugin/dict.vim* or in case of Pathogen:

    cd ~/.vim/bundle
    git clone https://github.com/szw/vim-dict.git


Usage
-----

To lookup a word (or words) in the dictionary use <code>Dict</code> command:

    :Dict hello
    :Dict start up

The <code>Dict</code> command uses hosts and databases defined in the
<code>g:dict\_hosts</code> global list. By default it is set to <code>[["dict.org",
["all"]]]</code> (the format will be explained a bit later).

<code>Dict</code> command can use a current word under the cursor. Just move the cursor to
a word and type in the command line:

    :Dict

You can also select words in the visual mode with help of the <code>DictSelection</code>
command:

    :DictSelection


Configuration
-------------

There are just a few global variables (options) you may set in the *.vimrc* file.

* <code>g:dict\_hosts</code>

  The most important one is a list <code>g:dict\_hosts</code> mentioned earlier. It
  combines hosts/databases used by **vim-dict**. The list entries are lists themselves and
  share the following format:

        ["host_name", ["database1", "database2", ...]]

  The sample extract from someone's  *~/.vimrc* file could look like this:

        let g:dict_hosts = [
            \["dict.org", ["all"]],
            \["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]
        \]

  Moreover **vim-dict** can help you figure out what databases are available on your
  servers. There is a special command for this:

        :DictShowDb

  You can even open your .vimrc and provide some host urls only:

        let g:dict_hosts = [
            \["dict.org", []],
            \["dict.mova.org", []]
        \]

  Then save and reload *.vimrc*, perform <code>DictShowDb</code> and yank-paste the
  databases you want :).

  The list of DICT servers can be found on the internet, e.g.
  [here](http://luetzschena-stahmeln.de/dictd/index.php).

* <code>g:dict\_leave\_pw</code>

  If set to <code>1</code> **vim-dict** leaves the preview window (the focus remains on
  the current window). By default it is set to <code>0</code>.

  Example:

        let g:dict\_leave\_pw = 0


Useful tips
-----------

On Ubuntu you might want to add system dictionary to Vim:

    set dictionary+=/usr/share/dict/words

This will enable the dictionary in the insert mode (CTRL-X CTRL-K). Additionaly it could
be useful to add the dictionary to the standard word completions (CTRL-N...) for text and
Markdown file types. To do this set the <code>complete</code> to include *k* value:

    au FileType text,markdown setlocal complete+=k


License
-------

Copyright &copy; 2012 Szymon Wrozynski. Distributed under the same terms as Vim itself.
See <code>:help license</code>

