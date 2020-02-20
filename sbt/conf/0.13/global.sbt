shellPrompt := (state ⇒ "\033[0;32m[SBT > " + Project.extract(state).currentRef.project + "]> \033[0m")

