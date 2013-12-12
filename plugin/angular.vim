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
command! -bar -nargs=1 -complete=customlist,g:Directive ADirective :call g:Directive(<f-args>)

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
  execute "normal! G?".a:type."(\<cr>%a.".a:type."(\'".a:name."\', [] function(){})\<esc>i"
endfunction

function! g:DeleteItem(type, name)
endfunction

function! g:Controller(name)
  set nofoldenable
  find ./app/js/controllers.js
  call g:FindOrAdd('controller', a:name)
endfunction
command! -bar -nargs=1 -complete=customlist,g:Controller AController :call g:Controller(<f-args>)

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
  set nofoldenable
  find ./app/js/filters.js
  call g:FindOrAdd('filter', a:name)
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
  if curfile == "./app/js/services.js"
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

