let [plugins, ftplugin] = dein#load_cache_raw(['/home/yuta/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/yuta/.vim/dein'
let g:dein#_runtime_path = '/home/yuta/.vim/dein/.dein'
let &runtimepath = '/home/yuta/.vim/dein/repos/github.com/Shougo/vimproc.vim,/home/yuta/.vim/dein/.dein,/home/yuta/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/yuta/.vim/after,/home/yuta/.vim/dein/repos/github.com/Shougo/dein.vim,/home/yuta/.vim/dein/.dein/after'
filetype off
