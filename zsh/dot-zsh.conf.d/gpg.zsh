# Setting GPG_TTY ensures that prompts from the GnuPG agent are routed to the correct terminal (including when you use it through an ssh connection). It also helps to handle cases in scripting correctly, when user interaction is required
export GPG_TTY=$(tty)
