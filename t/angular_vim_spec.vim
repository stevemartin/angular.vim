source ./plugin/angular.vim
describe 'g:AngularApp'
  describe 'when there is no angular file'
    it 'should be false'
      Expect g:AngularApp() == 0
    end
  end

  describe 'when there is an angular file'
    before
      call system("touch update-angular.sh")
    end
    it 'should be true'
      Expect g:AngularApp() == 1
    end
    after
      call system("rm update-angular.sh")
    end
  end

end

describe 'g:Directive'
end

