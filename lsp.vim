" LSP config
let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'golang-lsp',
        \ 'cmd': {server_info->['gopls']},
		\ 'workspace_config': { 'gopls': {
		\   'completeUnimported': v:true
		\ }},
        \ 'whitelist': ['go'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
	nnoremap <silent> K :LspHover<CR>
	nnoremap <silent> * :LspDefinition<CR>
    nnoremap <silent> <leader>i :LspDocumentDiagnostics<CR>
	au BufWritePre <buffer> :LspDocumentFormatSync
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
