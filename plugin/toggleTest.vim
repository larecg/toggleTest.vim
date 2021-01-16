if exists('g:loaded_toggleTest')
  finish
endif

let g:loaded_toggleTest = 1

let g:toggleTest_no_mappings = get(g:, "toggleTest_no_mappings", 0)
let g:toggleTest_useTestFolder = get(g:, "toggleTest_useTestFolder", 1)
let g:toggleTest_testFolder = get(g:, "toggleTest_testFolder", "tests")
let g:toggleTest_testFileSuffix = get(g:, "toggleTest_testFileSuffix", "test")

function! s:toggleTestFile() abort
  let l:currentFilePath = expand("%:p")
  let l:currentFileName = expand("%:t")
  let l:directoryName = expand("%:p:h:t")
  let l:currentFileExtension = expand("%:e")
  let l:currentFileDirectoryPath = expand("%:p:h")
  let l:isTestDirectory = l:directoryName =~# g:toggleTest_testFolder
  let l:isTestFile = l:currentFileName =~# g:toggleTest_testFileSuffix . "." . l:currentFileExtension

  let l:extensionLength = len(l:currentFileExtension) + 1
  let l:testFolderLength = len(g:toggleTest_testFolder) + 1
  let l:nameWithoutTestSuffixLength = l:extensionLength + len(g:toggleTest_testFileSuffix) + 1

  if l:isTestFile
    if g:toggleTest_useTestFolder && l:isTestDirectory
      execute "edit " . l:currentFileDirectoryPath[:-l:testFolderLength] . l:currentFileName[:-l:nameWithoutTestSuffixLength] . l:currentFileExtension
    else
      execute "edit " . l:currentFilePath[:-l:nameWithoutTestSuffixLength] . l:currentFileExtension
    endif
  else
    let l:testFileFolder = l:currentFileDirectoryPath . "/" . g:toggleTest_testFolder
    let l:testFileWithTestFolder = l:testFileFolder . "/" . l:currentFileName[:-l:extensionLength] . g:toggleTest_testFileSuffix . "." . l:currentFileExtension
    let l:testFileWithoutTestFolder = l:currentFileDirectoryPath . "/" . l:currentFileName[:-l:extensionLength] . g:toggleTest_testFileSuffix . "." . l:currentFileExtension

    if !g:toggleTest_useTestFolder || !empty(glob(l:testFileWithoutTestFolder))
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

if !g:toggleTest_no_mappings
  nmap <leader>ft <Plug>ToggleTestFile
endif

