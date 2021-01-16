if exists('g:loaded_toggleTest')
  finish
endif

let g:loaded_toggleTest = 1
let g:toggleTest_testFolder = "tests"
let g:toggleTest_testFileSuffix = "test"

function! s:toggleTestFile() abort
  let l:currentFileExtension = expand("%:e")
  let l:currentFilePath = expand("%:p")
  let l:currentFileName = expand("%:t")
  let l:directoryName = expand("%:p:h:t")
  let l:currentFileDirectoryPath = expand("%:p:h")
  let l:isTestFile = l:currentFileName =~ g:toggleTest_testFileSuffix . "." . l:currentFileExtension
  let l:isTestDirectory = l:directoryName =~ g:toggleTest_testFolder

  if l:isTestFile
    if l:isTestDirectory
      execute "edit " . l:currentFileDirectoryPath[:-6] . l:currentFileName[:-8] . l:currentFileExtension
    else
      execute "edit " . l:currentFilePath[:-8] . l:currentFileExtension
    endif
  else
    let l:testFileFolder = l:currentFileDirectoryPath . "/" . g:toggleTest_testFolder
    let l:testFileWithTestFolder = l:testFileFolder . "/" . l:currentFileName[:-3] . g:toggleTest_testFileSuffix . "." . l:currentFileExtension
    let l:testFileWithoutTestFolder = l:currentFileDirectoryPath . "/" . l:currentFileName[:-3] . g:toggleTest_testFileSuffix . "." . l:currentFileExtension

    if !empty(glob(l:testFileWithoutTestFolder))
      execute "edit " . l:testFileWithoutTestFolder
    else
      if !isdirectory(l:testFileFolder)
        call mkdir(l:testFileFolder, "p")
      endif
      execute "edit " . l:testFileWithTestFolder
    endif
  endif
endfunction


nnoremap <silent> <Plug>ToggleTestFile  :<C-U>call <SID>toggleTestFile()<CR>

if !exists("g:toggleTest_no_mappings") || ! g:toggleTest_no_mappings
  nmap <leader>ft <Plug>ToggleTestFile
endif

