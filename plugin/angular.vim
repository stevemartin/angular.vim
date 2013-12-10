function! g:Directives()
  find('app/js/directives.js')
endfunction
nnoremap <leader>ad :call g:Directives()<cr>

function! g:Controllers()
  find('app/js/controllers.js')
endfunction
nnoremap <leader>ac :call g:Controllers()<cr>

function! g:App()
  find('app/js/app.js')
endfunction
nnoremap <leader>aa :call g:App()<cr>

function! g:Filters()
  find('app/js/filters.js')
endfunction
nnoremap <leader>af :call g:Filters()<cr>

function! g:Services()
  find('app/js/services.js')
endfunction
nnoremap <leader>as :call g:Services()<cr>

function! g:AngularApp()
  if filereadable("update-angular.sh")
    return 1
  else
    return 0
  endif
endfunction
