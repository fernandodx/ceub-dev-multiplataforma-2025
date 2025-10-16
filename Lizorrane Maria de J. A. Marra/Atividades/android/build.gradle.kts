buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Plugin do Google Services (Firebase)
        classpath("com.google.gms:google-services:4.4.2")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Ajuste de diretórios do Flutter
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

// Importante: garante que o plugin do Google Services é aplicado corretamente
gradle.afterProject {
    if (name == "app") {
        pluginManager.apply("com.google.gms.google-services")
    }
}

// Tarefa de limpeza padrão
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
