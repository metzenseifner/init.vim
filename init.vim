filetype plugin indent on
set expandtab
set shiftwidth=2
set number

let mapleader = ","
noremap <Leader>§ 1}

function Osc52Yank()
  silent '<,'> yank
  " most recent yank is stored in @0, see h registers
  let buffer=system('base64 -w0', @0)
  " c represents the default clipboard
  let buffer='\033]52;c;'.buffer.'\007'
  silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
endfunction
noremap <leader>y :call Osc52Yank()<CR>
