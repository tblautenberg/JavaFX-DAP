package org.example;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;

public class App {
    public static void main(String[] args) throws IOException {

        // Repo path inside of docker container
        String localRepoDirPath = "/app/target-repo";

        // Github repo URL
        String remoteRepoURL = "https://github.com/tblautenberg/JavaFXtestAutoPull";

        // Make target-repo folder
        File targetDir = new File(localRepoDirPath);
        System.out.println("Creating target-repo folder");
        targetDir.mkdirs(); // Opretter target mappen

        // Clone github repo down to target-repo folder
        GitClone gitClone = new GitClone();
        gitClone.cloneRepository(localRepoDirPath, remoteRepoURL);
    }
}
