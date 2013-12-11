" Vim global plugin for editing angular.js apps in the angular seed form.

function! s:Directives()
  if filereadable("./app/js/directives.js")
    find ./app/js/directives.js
  else
    grep "directive\(" app/js/*.js
    clast
  end
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Directives ADirectives :call g:Directives()
nnoremap <leader>ad :call g:Directives()<cr>

function! s:Directive(name)
  find ./app/js/directives.js
  call s:FindOrAdd('directive', a:name)
endfunction

function! s:FindOrAdd(type, name)
  let curfile = bufname("%")
  if curfile == "app/js/".a:type."s.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found ".a:type."!"
    else
      if input("Didn't find ".a:type.", add one? ") == "yes"
        call g:AddItem(a:type, a:name)
      end
    end
  else
    echo "Didn't find ".a:type
  end
endfunction

function! s:AddItem(type, name)
  execute "normal! G?".a:type."(\<cr>%a.".a:type."(\'".a:name."\',)\<esc>i"
endfunction

function! s:DeleteItem(type, name)
endfunction

command! -buffer -bar -nargs=1 -complete=customlist,g:Directive ADirective :call g:Directive(<f-args>)
" nnoremap <leader>ad :call g:Directive()<cr>

function! s:Controller(name)
  find ./app/js/controllers.js
  let curfile = bufname("%")
  if curfile == "app/js/controllers.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found controller!"
    else
      if input("Didn't find controller, add one? ") == "yes"
        echo "Adding!"
        call g:AddItem('controller', a:name)
      end
    end
  else
    echo "Didn't find controller"
  end
endfunction
command! -buffer -bar -nargs=1 -complete=customlist,g:Controller AController :call g:Controller(<f-args>)

function! s:FindItem(name, type)
  let file_name = "app/js/".a:type.".js"
  echo file_name
  call findfile(file_name)
endfunction

function! s:Controllers()
  find ./app/js/controllers.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Controllers AControllers :call g:Controllers()
nnoremap <leader>ac :call g:Controllers()<cr>

function! s:App()
  find ./app/js/app.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:App AApp :call g:App()
nnoremap <leader>aa :call g:App()<cr>

function! s:Filters()
  find ./app/js/filters.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Filters AFilters :call g:Filters()
nnoremap <leader>af :call g:Filters()<cr>

function! s:Filter(name)
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
command! -buffer -bar -nargs=1 -complete=customlist,g:Filter AFilter :call g:Filter(<f-args>)

function! s:Services()
  find ./app/js/services.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Services AServices :call g:Services()
nnoremap <leader>as :call g:Services()<cr>

function! s:Service(name)
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
command! -buffer -bar -nargs=1 -complete=customlist,g:Service AService :call g:Service(<f-args>)

function! s:AngularApp()
  if filereadable("./update-angular.sh")
    return 1
  else
    return 0
  endif
endfunction

