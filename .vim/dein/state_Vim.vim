let [plugins, ftplugin] = dein#load_cache_raw(['/Users/yuta/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/yuta/.vim/dein'
let g:dein#_runtime_path = '/Users/yuta/.vim/dein/.dein'
let &runtimepath = '/Users/yuta/.vim/dein/repos/github.com/Shougo/vimproc.vim,/Users/yuta/.vim/dein/.dein,/Users/yuta/.vim,/usr/local/Cellar/macvim/7.4-104_1/MacVim.app/Contents/Resources/vim/vimfiles,/usr/local/Cellar/macvim/7.4-104_1/MacVim.app/Contents/Resources/vim/runtime,/usr/local/Cellar/macvim/7.4-104_1/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/yuta/.vim/after,/Users/yuta/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/yuta/.vim/dein/.dein/after'
filetype off
