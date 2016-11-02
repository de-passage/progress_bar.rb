A Tiny progress bar
===

Because 30+ files for a command line is just too much, here is a 40 lines implementation (could really be done in < 15 but it's already hard enough to follow). <br/>
Thread free (not thread-safe though), instanciation free, cost almost free, performance... you're supposed to use that on things that take time, don't come and complain for a few extra cycles. 

Use as follow:
```ruby
require "tiny_progress_bar"

25.times do |i|
	TinyProgressBar::print(max: 25)
	sleep 0.05
end
```

Uses backspaces to erase the previous input and write above it, so don't print stuffs on the `:out` strean while it's working or you'll mess everything up. Use the `:before` and `:after` options to set text around the bar.

This piece of code is not meant to be a one-fits-all ultimate integrated enterprise-level progress bar solution, it's just a pretty thing to slam on waiting times at low cost.<br/>
Google "ruby progress bar" for more feature complete and possibly less hacky solutions. 

Caution
---
This module is neither thread-safe nor exception-safe, you've been warned.

______

Customization
===
There's a few of customization options available, they go in the hash like this:
```ruby
TinyProgressBar::print(max: 100, filled: "@", empty: ".", size: 10)
```

Available options
---
* **size**:			_Integer_, determines the number of filled and empty items to display between the opening and closing sequences. Defaults to 100.

* **filled**:		_String_, the appearance of the filled part of the progress bar. Defaults to "\*". Try to match _empty_ in size or you'll get funny results. 

* **empty**:		_String_, the appearance of the part of the progress bar to be filled. Defaults to " " (empty space). See above. 

* **precision**:	_Integer_, the number of decimals to show in the figure based counter next to the bar. Defaults to 0. 

* **message**:		_String_, message to show when the progress bar reach completion. Default: "Complete!"

* **opener**:		_String_, Appearance of the opening sequence. Default: "["

* **closer**:		_String_, Appearance of the closing sequence. Default: "]"

* **before**:		_String_, Message to display before the progress bar

* **after**:		_String_, Message to display after the progress bar

* **out**:			_IO_, IO stream to send the bar to. `$stdout` by default
   
   
______


Compatibility
===
The code is based on printing backspaces to erase the previous progress bar. If for some reason that's not how it works on your system, get something else.


______


Licence
===
This work is under MIT licence, TL;DR do whatever you want with it but don't sue me over your misuse.

Copyright (c) 2016 Sylvain Leclercq

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
