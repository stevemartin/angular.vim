function Directives()
  find('app/js/directives.js')
endfunction

function AngularApp()
  if filereadable("update-angular.sh")
    return 1
  else
    return 0
  endif
endfunction
