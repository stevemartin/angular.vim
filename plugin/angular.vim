function! g:Directives()
  if filereadable("./app/js/directives.js")
    find ./app/js/directives.js
  else
    grep "directive\(" app/js/*.js
    clast
  end
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Directives ADirectives :call g:Directives()
nnoremap <leader>ad :call g:Directives()<cr>

function! g:Directive(name)
  find ./app/js/directives.js
  let curfile = bufname("%")
  if curfile == "app/js/directives.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found directive!"
    else
      if input("Didn't find directive, add one? ") == "yes"
        echo "Adding!"
        execute "normal G?directive(\<cr>%a.directive(\'".a:name."\',)\<esc>i"
      end
    end
  else
    echo "Didn't find directive"
  end
endfunction

command! -buffer -bar -nargs=1 -complete=customlist,g:Directive ADirective :call g:Directive(<f-args>)
" nnoremap <leader>ad :call g:Directive()<cr>

function! g:Controller(name)
  find ./app/js/controllers.js
  let curfile = bufname("%")
  if curfile == "app/js/controllers.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found controller!"
    else
      if input("Didn't find controller, add one? ") == "yes"
        echo "Adding!"
        execute "normal G?controller(\<cr>%a.controller(\'".a:name."\',)\<esc>i"
      end
    end
  else
    echo "Didn't find controller"
  end
endfunction
command! -buffer -bar -nargs=1 -complete=customlist,g:Controller AController :call g:Controller(<f-args>)

function! g:FindItem(name, type)
  let file_name = "app/js/".a:type.".js"
  echo file_name
  call findfile(file_name)
endfunction

function! g:Controllers()
  find ./app/js/controllers.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Controllers AControllers :call g:Controllers()
nnoremap <leader>ac :call g:Controllers()<cr>

function! g:App()
  find ./app/js/app.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:App AApp :call g:App()
nnoremap <leader>aa :call g:App()<cr>

function! g:Filters()
  find ./app/js/filters.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Filters AFilters :call g:Filters()
nnoremap <leader>af :call g:Filters()<cr>

function! g:Filter(name)
  find ./app/js/filters.js
  let curfile = bufname("%")
  if curfile == "app/js/filters.js"
    let resdict = searchpos(a:name)
    if(resdict != [0,0])
      echo "Found filter!"
    else
      if input("Didn't find filter, add one? ") == "yes"
        echo "Adding!"
        execute "normal G?filter(\<cr>%a.filter(\'".a:name."\',)\<esc>i"
      end
    end
  else
    echo "Didn't find filter"
  end
endfunction
command! -buffer -bar -nargs=1 -complete=customlist,g:Filter AFilter :call g:Filter(<f-args>)

function! g:Services()
  find ./app/js/services.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Services AServices :call g:Services()
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
command! -buffer -bar -nargs=1 -complete=customlist,g:Service AService :call g:Service(<f-args>)

function! g:AngularApp()
  if filereadable("./update-angular.sh")
    return 1
  else
    return 0
  endif
endfunction
