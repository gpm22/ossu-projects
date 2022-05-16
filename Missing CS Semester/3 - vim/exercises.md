# Exercises

1. Complete `vimtutor`. Note: it looks best in a [80x24](https://en.wikipedia.org/wiki/VT100) (80 columns by 24 lines) terminal window.

2. Install and configure a plugin: [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)

   1. Create the plugins directory with `mkdir -p ~/.vim/pack/vendor/start`
   2. Download the plugin: `cd ~/.vim/pack/vendor/start; git clone https://github.com/ctrlpvim/ctrlp.vim`
   3. Read the [documentation](https://github.com/ctrlpvim/ctrlp.vim/blob/master/readme.md) for the plugin. Try using CtrlP to locate a file by navigating to a project directory, opening Vim, and using the Vim command-line to start `:CtrlP`.
   4. Customize CtrlP by adding [configuration](https://github.com/ctrlpvim/ctrlp.vim/blob/master/readme.md#basic-options) to your `~/.vimrc` to open CtrlP by pressing Ctrl-P.

3. To practice using Vim, re-do the [Demo](https://missing.csail.mit.edu/2020/editors/#demo) from lecture on your own machine.

   ### Demo

   Here is a broken [fizz buzz](https://en.wikipedia.org/wiki/Fizz_buzz) implementation:

   ```python
   def fizz_buzz(limit):
       for i in range(limit):
           if i % 3 == 0:
               print('fizz')
           if i % 5 == 0:
               print('fizz')
           if i % 3 and i % 5:
               print(i)
   
   def main():
       fizz_buzz(10)
   ```

   Fix the following issues:

   - Main is never called
   - Starts at 0 instead of 1
   - Prints “fizz” and “buzz” on separate lines for multiples of 15
   - Prints “fizz” for multiples of 5
   - Uses a hard-coded argument of 10 instead of taking a command-line argument

   

4. Further customize your `~/.vimrc` and install more plugins.

5. (Advanced) Convert XML to JSON ([example file](https://missing.csail.mit.edu/2020/files/example-data.xml)) using Vim macros. Try to do this on your own, but you can look at the [macros](https://missing.csail.mit.edu/2020/editors/#macros) section above if you get stuck.