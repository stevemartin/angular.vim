function! g:Directives()
  find ./app/js/directives.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Directives ADirectives :call g:Directives()
nnoremap <leader>ad :call g:Directives()<cr>

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

function! g:Services()
  find ./app/js/services.js
endfunction
command! -buffer -bar -nargs=? -complete=customlist,g:Services AServices :call g:Services()
nnoremap <leader>as :call g:Services()<cr>

function! g:AngularApp()
  if filereadable("./update-angular.sh")
    return 1
  else
    return 0
  endif
endfunction
