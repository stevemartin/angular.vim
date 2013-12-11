" Vim global plugin for editing angular.js apps in the angular seed form.

if exists('g:loaded_angular_vim')
  finish
endif
let g:loaded_angular_vim = 1

function! g:Directives()
  if filereadable("./app/js/directives.js")
    find ./app/js/directives.js
  else
    grep "directive\(" app/js/*.js
    clast
  end
endfunction
command! -bar -nargs=0 -complete=customlist,g:Directives ADirectives :call g:Directives()
nnoremap <leader>ad :call g:Directives()<cr>

function! g:Directive(name)
  set nofoldenable
  find ./app/js/directives.js
  call g:FindOrAdd('directive', a:name)
endfunction

function! g:FindOrAdd(type, name)
  let curfile = bufname("%")
  if curfile == "./app/js/".a:type."s.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found ".a:type."!"
    else
      if input("Didn't find ".a:type.", add one? ") == "yes"
        call g:AddItem(a:type, a:name)
      end
    end
  else
    echo "Didn't find ".a:type.", current file: ".curfile
  end
endfunction

function! g:AddItem(type, name)
  execute "normal! G?".a:type."(\<cr>%a.".a:type."(\'".a:name."\',)\<esc>i"
endfunction

function! g:DeleteItem(type, name)
endfunction

command! -bar -nargs=1 -complete=customlist,g:Directive ADirective :call g:Directive(<f-args>)
" nnoremap <leader>ad :call g:Directive()<cr>

function! g:Controller(name)
  set nofoldenable
  find ./app/js/controllers.js
  let curfile = bufname("%")
  if curfile == "./app/js/controllers.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found controller!"
    else
      if input("Didn't find controller, add one? ") == "yes"
        echo "Adding!"
        execute "silent normal! G?controller(?e\<cr>%a.controller(\'".a:name."\',)\<esc>i"
      end
    end
  else
    echo "Didn't find controller file, current file: ".curfile
  end
endfunction
command! -bar -nargs=1 -complete=customlist,g:Controller AController :call g:Controller(<f-args>)

function! g:FindItem(name, type)
  let file_name = "app/js/".a:type.".js"
  echo file_name
  call findfile(file_name)
endfunction

function! g:Controllers()
  find ./app/js/controllers.js
endfunction
command! -bar -nargs=? -complete=customlist,g:Controllers AControllers :call g:Controllers()
nnoremap <leader>ac :call g:Controllers()<cr>

function! g:App()
  find ./app/js/app.js
endfunction
command! -bar -nargs=? -complete=customlist,g:App AApp :call g:App()
nnoremap <leader>aa :call g:App()<cr>

function! g:Filters()
  find ./app/js/filters.js
endfunction
command! -bar -nargs=? -complete=customlist,g:Filters AFilters :call g:Filters()
nnoremap <leader>af :call g:Filters()<cr>

function! g:Filter(name)
  " find ./app/js/filters.js
  let curfile = bufname("%")
  if curfile == "app/js/filters.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found filter!"
    else
      if input("Didn't find filter, add one? ") == "yes"
        echo "Adding!"
        call g:AddItem('filter', a:name)
      end
    end
  else
    echo "Didn't find filter"
  end
endfunction
command! -bar -nargs=1 -complete=customlist,g:Filter AFilter :call g:Filter(<f-args>)

function! g:Services()
  find ./app/js/services.js
endfunction
command! -bar -nargs=? -complete=customlist,g:Services AServices :call g:Services()
nnoremap <leader>as :call g:Services()<cr>

function! g:Service(name)
  find ./app/js/services.js
  let curfile = bufname("%")
  if curfile == "app/js/services.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found service!"
    else
      echo "Didn't find service"
    end
  else
    echo "Didn't find service"
  end
endfunction

if !exists(":AService")
  command! -bar -nargs=1 -complete=customlist,g:Service AService :call g:Service(<f-args>)
endif

function! g:AngularApp()
  if filereadable("./update-angular.sh")
    return 1
  else
    return 0
  endif
endfunction

" augroup angularPluginDetect
"   autocmd!
"   autocmd BufNewFile,BufRead * call g:Detect(expand("<afile>:p"))
"   autocmd VimEnter * if expand("<amatch>") == "" && !exists("b:rails_root") | call g:Detect(getcwd()) | endif | if exists("b:rails_root") | silent doau User BufEnterRails | endif
"   autocmd FileType netrw if !exists("b:rails_root") | call g:Detect(expand("%:p")) | endif | if exists("b:rails_root") | silent doau User BufEnterRails | endif
"   autocmd BufEnter * if exists("b:rails_root")|silent doau User BufEnterRails|endif
"   autocmd BufLeave * if exists("b:rails_root")|silent doau User BufLeaveRails|endif
"   autocmd Syntax railslog if g:autoload()|call rails#log_syntax()|endif
" augroup END
