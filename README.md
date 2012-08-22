vim-dict
========

**vim-dict** is a dict client. It uses **curl** to connect to dict servers, so make sure
you have **curl** installed.


Installation
------------

Place in *~/.vim/plugin/dict.vim* or in case of Pathogen:

    cd ~/.vim/bundle
    git clone https://github.com/szw/vim-dict.git


Usage
-----

To lookup a word (or words) in the dictionary use `Dict` command:

    :Dict hello
    :Dict start up

The `Dict` command uses hosts and databases defined in the `g:dict_hosts` global list. By
default it is set to `[["dict.org", ["all"]]]` (the format will be explained a bit later).

`Dict` command can use a word under the cursor. Just move the cursor to a word and type in
the command line:

    :Dict

The same works on selection - just select multiple words in the Visual mode.

Configuration
-------------

There are just a few global variables (options) you may set in the *.vimrc* file.

* `g:dict_hosts`

  The most important one is a list `g:dict_hosts` mentioned earlier. It combines
  hosts/databases used by **vim-dict**. The list entries are lists themselves and share
  the following format:

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

  Then save and reload *.vimrc*, perform `DictShowDb` and yank-paste the databases you
  want :).

  The list of DICT servers can be found on the internet, e.g.
  [here](http://luetzschena-stahmeln.de/dictd/index.php).

* `g:dict_leave_pw`

  If set to `1` **vim-dict** leaves the preview window (the focus remains on the current
  window). By default it is set to `0`.

  Example:

        let g:dict_leave_pw = 0

* `g:dict_curl_command`[*][1]

  This variable holds the curl command to be fired by `Dict` function. You will find it
  handy if **curl** is not on your `$PATH` environment variable. By default it is set to
  `"curl"`.

  Example:

        let g:dict_curl_command = "curl"


* `g:dict_curl_options`[*][1]

  Sometimes you might want to add additional options to the curl invocation, e.g.
  additonal proxy settings. By default it defines only the connection timeout. Notice, the
  option `-s` (silent) is always present regardless of this variable.

  Example:

        let g:dict_curl_options = "--connect-timeout 30"


Useful tips
-----------

On Ubuntu you might want to add system dictionary to Vim:

    set dictionary+=/usr/share/dict/words

This will enable the dictionary in the insert mode (CTRL-X CTRL-K). Additionaly it could
be useful to add the dictionary to the standard word completions (CTRL-N...) for text and
Markdown file types. To do this set the `complete` to include *k* value:

    au FileType text,markdown setlocal complete+=k


License
-------

Copyright &copy; 2012 Szymon Wrozynski. Distributed under the same terms as Vim itself.
See `:help license`

[1]: https://github.com/szw/vim-dict/pull/1  "Thanks to Ingo Karkat"
