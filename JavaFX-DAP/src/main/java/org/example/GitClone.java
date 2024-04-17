package org.example;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.errors.GitAPIException;

import java.io.File;

public class GitClone {
    public void cloneRepository(String localRepoDirPath, String remoteRepoURL) {
        File localRepoDir = new File(localRepoDirPath);

        try {
            // Kloner git rep ned til vores maskine udfrå URL og gemmer det i den angivne mappe
            Git.cloneRepository()
                    .setURI(remoteRepoURL)
                    .setDirectory(localRepoDir)
                    .call();

            System.out.println("Github repo cloned to: " + localRepoDirPath);
        } catch (GitAPIException e) {
            System.err.println("Error when cloneing github repo: " + e.getMessage());
        }
    }
}
