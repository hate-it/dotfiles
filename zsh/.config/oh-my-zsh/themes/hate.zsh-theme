PROMPT="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%}'
PROMPT+='$(kube_ps1)%{$reset_color%}'
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

KUBE_PS1_PREFIX="%{$fg_bold[blue]%} ["
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SUFFIX="%{$fg_bold[blue]%}]"
KUBE_PS1_SYMBOL_ENABLE=false

function get_cluster_short() {
    case $1 in
    prod)
        echo "prod"
        ;;
    *)
        echo "$1" | head -c 1
        ;;
    esac
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

function get_namespace_short() {
    echo "$1" | sed 's/ecom-//g' | sed 's/staging/qa/g' | sed 's/production/prod/'
}

export KUBE_PS1_NAMESPACE_FUNCTION=get_namespace_short
