
### Tips on `live_grep`
```
 $ rg clap
[lots of results]
```

But this shows us many things, and we're only interested in where we wrote
clap as a dependency. Instead, we could limit ourselves to TOML files, which is how dependencies are communicated to Rust's build tool, Cargo:

```
$ rg clap -g '*.toml'
Cargo.toml
35:clap = "2.26"
51:clap = "2.26"
```

The `-g '*.toml'` syntax says, "make sure every file searched matches this
glob pattern." Note that we put `'*.toml'` in single quotes to prevent our shell from expanding the *.

If we wanted, we could tell ripgrep to search anything but *.toml files:

`$ rg clap -g '!*.toml'`

This will give you a lot of results again as above, but they won't include
files ending with .toml. Note that the use of a ! here to mean "negation" is
a bit non-standard, but it was chosen to be consistent with how globs in .
gitignore files are written. (Although, the meaning is reversed. In .
gitignore files, a ! prefix means whitelist, and on the command line, a ! means blacklist.)

Globs are interpreted in exactly the same way as .gitignore patterns. That is
, later globs will override earlier globs. For example, the following command will search only *.toml files:

`$ rg clap -g '!*.toml' -g '*.toml'`

Interestingly, reversing the order of the globs in this case will match
nothing, since the presence of at least one non-blacklist glob will institute
a requirement that every file searched must match at least one glob. In this
case, the blacklist glob takes precedence over the previous glob and prevents
any file from being searched at all!
Manual filtering: file types

Over time, you might notice that you use the same glob patterns over and over
. For example, you might find yourself doing a lot of searches where you only
want to see results for Rust files:

`$ rg 'fn run' -g '*.rs'`

Instead of writing out the glob every time, you can use ripgrep's support for file types:

`$ rg 'fn run' --type rust`

or, more succinctly,

`$ rg 'fn run' -trust`

The way the `--type` flag functions is simple. It acts as a name that is
assigned to one or more globs that match the relevant files. This lets you
write a single type that might encompass a broad range of file extensions.
For example, if you wanted to search C files, you'd have to check both C
source files and C header files:

`$ rg 'int main' -g '*.{c,h}'`

or you could just use the C file type:

`$ rg 'int main' -tc`

Just as you can write blacklist globs, you can blacklist file types too:

`$ rg clap --type-not rust`

or, more succinctly,

`$ rg clap -Trust`

That is, -t means "include files of this type" where as -T means "exclude files of this type."

To see the globs that make up a type, run rg --type-list:

`$ rg --type-list | rg '^make:'`
make: *.mak, *.mk, GNUmakefile, Gnumakefile, Makefile, gnumakefile, makefile

By default, ripgrep comes with a bunch of pre-defined types. Generally, these
types correspond to well known public formats. But you can define your own
types as well. For example, perhaps you frequently search "web" files, which
consist of JavaScript, HTML and CSS:

`$ rg --type-add 'web:*.html' --type-add 'web:*.css' --type-add 'web:*.js' -tweb title`

or, more succinctly,

```
$ rg --type-add 'web:*.{html,css,js}' -tweb title
```

The above command defines a new type, web, corresponding to the glob *.{html,
css,js}. It then applies the new filter with -tweb and searches for the pattern title. If you ran

```
$ rg --type-add 'web:*.{html,css,js}' --type-list
```

Then you would see your web type show up in the list, even though it is not part of ripgrep's built-in types.

It is important to stress here that the --type-add flag only applies to the
current command. It does not add a new file type and save it somewhere in a
persistent form. If you want a type to be available in every ripgrep command,
then you should either create a shell alias:

alias rg="rg --type-add 'web:*.{html,css,js}'"

or add --type-add=web:*.{html,css,js} to your ripgrep configuration file. (Configuration files are covered in more detail later.)
The special all file type

A special option supported by the --type flag is all. --type all looks for a
match in any of the supported file types listed by --type-list, including
those added on the command line using --type-add. It's equivalent to the
command rg --type agda --type asciidoc --type asm ..., where ... stands for a
list of --type flags for the rest of the types in --type-list.

As an example, let's suppose you have a shell script in your current directory
, my-shell-script, which includes a shell library, my-shell-library.bash.
Both rg --type sh and rg --type all would only search for matches in
my-shell-library.bash, not my-shell-script, because the globs matched by the
sh file type don't include files without an extension. On the other hand, rg
--type-not all would search my-shell-script but not my-shell-library.bash.
