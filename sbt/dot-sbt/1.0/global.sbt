import sbt.errorssummary.Plugin.autoImport._
import com.scalapenos.sbt.prompt.SbtPrompt.autoImport._
import com.scalapenos.sbt.prompt._

def projectName(style: Style) = text(state ⇒ {
    val extracted = Project.extract(state)
    val project = extracted.getOpt(sbt.Keys.name).getOrElse(Project.extract(state).currentProject.id)

    // if (project == root) project else s"${root}/${project}"
    project
  }, style)

def gitExists = {
  java.nio.file.Files.exists(java.nio.file.Paths.get("./.git"))
}

def branchName = {
  if (gitExists) {
    gitBranch(clean = fg(235).bg(34), dirty = fg(235).bg(214)).padLeft("  ").padRight(" ")
  } else {
    text("", fg(235).bg(26))
  }
}

promptTheme := PromptTheme(
    List(
      text(" SBT ", fg(235).bg(26)),
      branchName,
      projectName(fg(250).bg(235)).pad(" "),
      text(" ", NoStyle)
    ),
    (previous, next) ⇒ StyledText("", fg(previous.style.background).bg(next.style.background))
  )

shellPrompt := (state ⇒ promptTheme.value.render(state))
bloopAggregateSourceDependencies in Global := true
bloopExportJarClassifiers in Global := Some(Set("sources"))

reporterConfig := reporterConfig.value.withReverseOrder(true)

