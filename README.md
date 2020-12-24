# git-log-stats
Find contributions made by user in a particular project's `git log` and generates excel using single command.

# STEPS TO GENERATE EXCEL
1. Fill values in config.txt.

  - A sample of how a config.txt should look like.
  ```
  USERNAME="sameeran"
  DIRECTORIES="flang/ mlir/"  
  COMMITOUTPUTFILE="sameeran_commits.txt"
  REVIEWOUTPUTFILE="sameeran_reviewed.txt"
  
  TARGET_PROJECT_DIR="/home/amd/Workspace/tool-chain/f18-llvm-project/"
  ```
  
  A few comments on `config.txt`
   - `USERNAME`
     - Field could be the emails as well, just be sure to have the value such that it's a unique value a user will be searched in git log.
   - `DIRECTORIES`
     - The sub-repositories from the project where you want to find the commits. The script finds the git log of only the commits in the specified folders.
       This turns to be useful when a user has multiple commits in a project and we are very interested to find his commits in a very specific sub-project.
   - `COMMITOUTPUTFILE`
     - The name of the commits file where you want the Tab Seperated Values to be outputted in.
   - `REVIEWOUTPUTFILE`
     - The name of the code reviews file where you want the Tab Seperated Values to be outputted in.
   - `TARGET_PROJECT_DIR`
     - The parent directory of the project on which you want to run the scripts.
      `Note` - You can identify it easily as it should contain the `.git` hidden folder.
      
2. To generate the commit's by user.
   - `bash genCommitsTextFileSummary.sh`

3. To generate the code reviewed by user, currently very specific keyword are used based on LLVM-PROJECT.
   If needed please modify `trailers.awk` for your project. 
   - `bash genReviewTextFileSummary.sh`
