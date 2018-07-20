# ~/.ipython/profile_default/ipython_config.py

c = get_config()

# Run all nodes interactively
c.InteractiveShell.ast_node_interactivity = "all"

c.InteractiveShellApp.matplotlib = "inline"

c.InteractiveShellApp.exec_lines = [
    'from IPython.display import FileLinks'
    'def lsz(): return FileLinks(".")'
]
