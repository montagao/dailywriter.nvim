augroup DailyWriter
    autocmd!
    autocmd CursorMoved,CursorHold,TextChanged,TextChangedI * lua require'dailywriter'.word_count()
augroup END

command! Today lua require'dailywriter'.open_today()
command! Past lua require'dailywriter'.list_past()
command! GitSync lua require'dailywriter'.git_sync()

