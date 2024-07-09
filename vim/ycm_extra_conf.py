def Settings(**kwargs):
    language = kwargs['language']
    if language == 'bash':
        return {
            'ls': {
                'command': 'bash-language-server',
                'args': ['start'],
            }
        }
    elif language == 'vim':
        return {
            'ls': {
                'command': 'vim-language-server',
                'args': ['--stdio'],
            }
        }
    return {}

