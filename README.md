# Pbcopy

Enables piping and redirecting into pbcopy from within Ruby.

Mac OS X only.

This lib is intended as a development aid, not a production utility.

Note that this adds `String#|`


## Pipe strings into pbcopy

On the command line you might do

    $ which ruby | pbcopy

Which would copy the location of the ruby binary into your system's paste board. Later you could retrieve it with Command-V.

In Ruby you can pipe any string into pbcopy to achieve the same result

    RUBY_VERSION | pbcopy
    User.last.login | pbcopy


## Redirect arbitrary objects into pbcopy

On the command line you might do

    $ pbcopy < some_file

In Ruby you can do

    pbcopy < 123
    pbcopy < [4, 5, 6]

You can redirect any arbitrary object into pbcopy, it will be turned into a string (via `#to_s`) and placed in the system clipboard


## Shorter more Ruby-like version of redirect

You can omit the chevron when redirecting into pbcopy

    pbcopy 123
    pbcopy [4, 5, 6]


## Make available in irb / pry

    $ echo 'require "pbcopy"' >> ~/.irbrc
    $ echo 'require "pbcopy"' >> ~/.pryrc

Of course, if you're using Bundler, this won't work (b/c you're on a team and your
team shouldn't have to know about and install your personal dev tools). So you can do
this absurd monstrosity (you can figure out which paths to add via `$ gem which pbcopy pasteboard`)


    begin
      require "pbcopy"
    rescue LoadError
      $LOAD_PATH << '~/.rvm/gems/ruby-1.9.3-p125@global/gems/pbcopy-1.0.1/lib/'
      $LOAD_PATH << '~/.rvm/gems/ruby-1.9.3-p125/gems/pasteboard-1.0/lib/'
      require 'pbcopy'
    end



## Installation

    $ gem install pbcopy
