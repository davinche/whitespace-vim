# Whitespace Plugin

This plugin highlights trailing white spaces. It can also strip white spaces on file save.  
Based on (and simplified from) [vim-better-whitespace][better-whitespace]

## Installation

With the use of a plugin manager like [vim-plugged][vim-plugged]:

```
Plug 'davinche/whitespace-vim'
```

## Usage

The plugin comes with the following commands:

* Enable highlighting of trailing white spaces
  ```
  :EnableTrailingWhiteSpaceHighlight
  ```

* Disable highlighting of trailing white spaces
  ```
  :DisableTrailingWhiteSpaceHighlight
  ```

* Enable strip whitespace on save
  ```
  :EnableStripWhiteSpaceOnSave
  ```

* Disable strip whitespace on save
  ```
  :DisableStripWhiteSpaceOnSave
  ```

* To toggle trailing whitespace highlighting:
  ```
  :ToggleTrailingWhiteSpaceHighlight
  ```

* To toggle stripping whitespace on save:
  ```
  :ToggleStripWhiteSpaceOnSave
  ```

You can also set the following variables:

* Highlight whitespace by default
  `let g:highlight_whitespace = 1`

* Strip whitespaces on save by default
  `let g:strip_whitespace_on_save = 1`

[vim-plugged]: https://github.com/junegunn/vim-plug
[better-whitespace]: https://github.com/ntpeters/vim-better-whitespace
