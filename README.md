# Tim Conway's Game of Life in Ruby

This Ruby implementation of Tim Conway's Game of Life was built during a local 
[Code Retreat](http://coderetreat.org/about) in Athens, Georgia November 15, 2014.

This project was implemented with Ruby 2.x development environment with Rspec 3.0 for testing.  

To run the tests simply type "rspec" on the command line.  To run the app, type "ruby run.rb"

This app in its current form makes a slight change to the general rules which we were using to explore 
changing the program after it was written.  The rule calls for allowing cells that are dying to linger on and 
influence the board an extra turn.  So a cell that is "dying" is still alive for an extra round and can influence
both birthing of new cells as well as triggering overcrowding die-offs.

To watch the game in the browser, simply open the board.html file after starting "ruby run.rb"  The browser should 
auto-refresh itself due to the refresh meta-key tag being set in the HEAD section of the generated HTML document.

---

##### LICENSE #####

Copyright (c) 2014 Michael Lang

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
