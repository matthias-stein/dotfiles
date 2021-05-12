from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    """Basic theme which only uses colors in 0-15 range"""
    USERNAME_FG = 120
    USERNAME_BG = 60
    USERNAME_ROOT_BG = 210

    HOSTNAME_FG = 59
    HOSTNAME_BG = 103 

    HOME_SPECIAL_DISPLAY = False
    PATH_BG = 183 
    PATH_FG = 59 
    CWD_FG = 231
    SEPARATOR_FG = 159

    READONLY_BG = 229
    READONLY_FG = 59

    REPO_CLEAN_BG = 2   # green
    REPO_CLEAN_FG = 0   # black
    REPO_DIRTY_BG = 1   # red
    REPO_DIRTY_FG = 15  # white

    JOBS_FG = 59
    JOBS_BG = 103

    CMD_PASSED_BG = 159
    CMD_PASSED_FG = 59
    CMD_FAILED_BG = 210
    CMD_FAILED_FG = 59

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    VIRTUAL_ENV_BG = 212
    VIRTUAL_ENV_FG = 59

    AWS_PROFILE_FG = 14
    AWS_PROFILE_BG = 8

    TIME_FG = 8
    TIME_BG = 7
