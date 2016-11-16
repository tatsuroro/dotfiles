""" denite
call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts',
\ ['--nocolor', '--nogroup'])
call denite#custom#source('file_rec', 'matcher',
\ ['matcher_cpsm', 'matcher_fuzzy'])
call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher_cpsm', 'matcher_fuzzy', 'matcher_project_files'])

" custom map
call denite#custom#map('_', "<C-l>", 'quit')
call denite#custom#map('insert', "<C-j>", 'move_to_next_line')
call denite#custom#map('insert', "<C-k>", 'move_to_prev_line')

""" denite menu items
let s:menus = {}
let s:menus.zsh = { 'description': 'zsh configuration' }
let s:menus.zsh.file_candidates = [
\ ['zshrc', '~/.zshrc'], ['zplug', '~/.init.zplug']]
let s:menus.my_commands = { 'description': 'my commands' }
let s:menus.my_commands.command_candidates = [
\ ['Split the window', 'vnew'], ['Open zsh menu', 'Denite menu:zsh']]

call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#option('default', 'prompt', '>')
