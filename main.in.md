# Pbat

Pbat is batch file preprocessor developed to introduce functions, macro expressions and automate PATH variable management.

Pbat script is compiled into bat file to run localy and (optionaly) into yaml workflow to run on github actions runner.

# Functions

Pbat script contains of functions. Each function represents one step of the workflow. Functions introduced by `def` keyword. Function body consists of shell commands and macro expressions.

%functions1

Last defined function become main step.

%functions2

To chain steps (prepend them to workflow) add `depends on ...name` to function definition.

%functions3

# Macros

Macro expression consists of name and comma-separated arguments enclosed in parenthesis, strings may be enclosed into double quotes, but it's not required. Arguments can be positional and named, named arguments expressed as `:name=value` or just `:name` for boolean true value.

`use(program)` includes relative paths into PATH variable. Defined for cmake, ninja and some other tools.

`download(url, [file], [:cache])` curls specified url into local file, if `:cache` specified curl is only called if file not exist.

`add_path(path)` appends path into PATH env variable.

`unzip(zip_path, [:test=path/to/file/or/dir], [:output=path/to/dir])` unzips zip_path using 7z, if `:test` specified 7z is only called if file not exist.

`zip(zip_path, [...path], [:test])` zips one or many paths into zip_path.

`if_exist_return(path)` exits function if path exists.

`return()` exist function unconditionally.

`patch(path, [:p1], [:N])` calls patch.

`git_clone(url, [:ref=tag], [:pull])` clones git repo.

%macros1

There are a number of `github_` macros that do nothing for local script but add steps into github actions workflow.

`github_checkout()`

`github_cache(...path, :key=key)` 

`github_upload(path, [:name=name])`

`github_release(path)`

To turn on github workflow generation add `github-workflow 1` anywhere in script.

%macros2

Lets cache build artifact time.txt using cache action on github workflow and filesystem persistance localy.

%macros3

You can split code into multiple files and use `include(path)` to put it back together.

%dep1

%include1

# PATH pollution

Some applications change their behaviour depending on `rm`, `bash`, `sed`, etc availability in PATH (`qmake` for example generates completely different makefiles, although they work as well, it makes me uneasy), to avoid poluting PATH when `download` or `patch` is used, you can use `env-policy 1` to use `%PATCH%` and `%CURL%` env variables containing full path to this utilities.

%env_policy1

%env_policy2

# Notes

Identation is optional.

# Advanced usage

With `pbat` you can build advanced readable pipelines consisting of clearly defined reusable blocks.

%advanced1

# Install

```
pip install pbat
```

# Compile scripts

```cmd
python -m pbat.compile path/to/file/or/dir
```
or
```cmd
pbat path/to/file
```

# Watch and compile

You can use `eventloop` to trigger `pbat` on filechange

```cmd
onchange path\to\dir -i *.pbat -- pbat FILE
```

```cmd
onchange path\to\file -- pbat FILE
```

# More examples 

[antlr4-cpp-demo/build.pbat](https://github.com/mugiseyebrows/antlr4-cpp-demo/blob/main/build.pbat)